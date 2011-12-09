namespace :import_moments do 

  namespace :beers do
    desc 'beer moments from untappd'
    task :untappd => :environment do
      offset = 0
      query = true
      until query == false 
        checkins = Untappd::User.feed('simeonsdotnet', :offset => offset)
        query = false if checkins.size == 0
        checkins.each do |c|
          Beer.create(
            :created_at => DateTime.parse(c.created_at),
            :origin_poid => c.checkin_id.to_i,
            :name => c.beer_name,
            :brewery => c.brewery_name,
            :description => c.check_in_comment.present? ? c.check_in_comment : nil,
            :icon => c.beer_stamp == 'https://untappd.s3.amazonaws.com/site/assets/images/temp/badge-beer-default.png' ? nil : c.beer_stamp
          )
        end
        offset += 25
      end
    end
  end

  namespace :dailies do
    desc 'daily moments from momentile'
    task :momentile => :environment do
      agent = Mechanize.new
      agent.user_agent = 'simeons.net importer'
      tiles = agent.get 'http://momentile.com/simeonsdotnet/tiles/'
      pages = tiles.at('div.pagination.group').text.match(/Page 1 of (\d+)/)[1].to_i
      (1..pages).each do |page_number|
        agent.get("http://momentile.com/simeonsdotnet/tiles/?page=#{page_number}") do |page|
          page.search('article.tile-entry a>img').each do |img|
            Daily.create(:created_at => DateTime.parse(img.attributes['alt'].text), :origin_poid => img.attributes['src'].text.split('/')[2].to_i)
          end 
        end 
      end 
    end
  end
end
