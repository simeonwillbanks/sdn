namespace :import_moments do 

  namespace :songs do
    desc 'songs from hash'
    task :ofthemoment => :environment do
      [
        {"created_at"=>[2008, 7, 1, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=yljbcRu3tiU","title"=>"I'm Free","artist"=>"Soup Dragons"},
        {"created_at"=>[2008, 8, 4, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=lnF_-woyN70","title"=>"The General","artist"=>"Dispatch"},
        {"created_at"=>[2008, 9, 12, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=g3YeuM7ZFwg","title"=>"Summertime","artist"=>"Fresh Prince & DJ Jazzy Jeff on Soul Train"},
        {"created_at"=>[2008, 12, 17, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=bXKNqm5ZGw8","title"=>"Don't Wanna Cry","artist"=>"Pete Yorn"},
        {"created_at"=>[2009, 4, 22, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=sc73XNoIDMA","title"=>"Funny the Way It Is (MSG - NYC - 04.14.2009)","artist"=>"Dave Matthews Band"},
        {"created_at"=>[2009, 4, 30, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=Ss02sfQinxI","title"=>"Get off of My Cloud","artist"=>"The Rolling Stones (Live - 1967)"},
        {"created_at"=>[2009, 5, 1, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=msCCBPy8iCk","title"=>"I'll Go Crazy If I Don't Go Crazy Tonight","artist"=>"U2 Live On Letterman"},
        {"created_at"=>[2009, 7, 31, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=rK0LWsEcSjM","title"=>"Rodeo Clowns, Heading Home & Rainbow","artist"=>"Jack Johnson, Donavon Frankenreiter & G-Love at the Orange Lounge"},
        {"created_at"=>[2009, 8, 12, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=BCwCBh0z3Hs","title"=>"All Along The Watchtower Live!","artist"=>"Jimi Hendrix"},
        {"created_at"=>[2009, 8, 24, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=8-5gipOwIbM","title"=>"One Big Holiday","artist"=>"My Morning Jacket"},
        {"created_at"=>[2009, 9, 2, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=d97XFGR_IP0","title"=>"Human","artist"=>"The Killers"},
        {"created_at"=>[2009, 10, 6, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=Lr1Kxdj9Hr8","title"=>"Forever My Friend","artist"=>"Ray Lamontagne on Letterman"},
        {"created_at"=>[2010, 11, 12, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=hjLEodBLqi0","title"=>"Everything (Big Room Mix)","artist"=>"Kaskade"},
        {"created_at"=>[2010, 11, 22, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=KHhKnc0XZrs","title"=>"Whipping Post","artist"=>"The Allman Brothers Band - Fillmore East - 09/23/1970"},
        {"created_at"=>[2009, 12, 30, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=Y2s8_hCCHg4","title"=>"The Man In Me","artist"=>"Bob Dylan"},
        {"created_at"=>[2010, 1, 17, 0, 0, 0],"listen"=>"http://youtube.com/watch?v=KSBrvX5CLYU","title"=>"Anyone Seen The Bridge > Too Much","artist"=>"Dave Matthews Band - Mile High Music Festival - 7/20/2008"},
        {"created_at"=>[2010, 2, 13, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=yR7bgihHKXU","title"=>"Remedy","artist"=>"The Black Crowes (The Most Rock 'n Roll Rock 'n Roll Band in the World)"},
        {"created_at"=>[2010, 3, 30, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=n7VU2Uqa2d4","title"=>"Roadhouse Blues (Live)","artist"=>"The Doors"},
        {"created_at"=>[2010, 4, 2, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=ERQzl4xDpXk","title"=>"Electric Relaxation","artist"=>"A Tribe Called Quest"},
        {"created_at"=>[2010, 4, 17, 0, 0, 0],"listen"=>"http://youtube.com/watch?v=pWgecIRgtbE","title"=>"Cry Freedom","artist"=>"Dave Matthews & Tim Reynolds - 4/11/08"},
        {"created_at"=>[2010, 5, 13, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=T6SvXr9r3OQ","title"=>"Chase The Sun","artist"=>"Planet Funk"},
        {"created_at"=>[2010, 6, 12, 0, 0, 0],"listen"=>"http://www.youtube.com/watch?v=LHcziyC9nZI","title"=>"When The Yanks Go Marching In","artist"=>"American Outlaws"}
      ].each do |song|
        Song.create(
          :title => song['title'],
          :listen => song['listen'],
          :artist => song['artist'],
          :created_at => Date.new(song['created_at'][0],song['created_at'][1],song['created_at'][2]),
          :tag_list => 'SongOfTheMoment'
        )
      end
    end
  end

  namespace :videos do
    desc 'videos from flickr'
    task :flickr => :environment do
      # Just use photos:flickr and switch on media to reduce API requests
    end

    desc 'videos from youtube'
    task :youtube => :environment do
      client = YouTubeIt::Client.new(:dev_key => ENV['YOUTUBE_DEVELOPER_KEY'])
      client.videos_by(:query => "simeonsdotnet").videos.each do |video|
        Video.create(
          :title => video.title,
          :description => video.description.present? ? video.description : nil,
          :origin_poid => video.video_id.split(':').last,
          :origin => 'youtube',
          :tag_list => 'YouTube, ' + video.keywords.join(", "),
          :created_at => video.published_at
        )
      end
    end
  end

  namespace :photos do
    desc 'photos from flickr'
    task :flickr => :environment do
      page = 1
      query = true
      until query == false
        photos = flickr.people.getPhotos(:user_id => ENV['FLICKR_USER_ID'], :per_page => 500, :page => page, :extras => 'description,date_upload,date_taken,tags,media')
        query = false if photos.size == 0
        photos.each do |f|
          if f.media == 'photo'
            Photo.create(
              :title => f.title.present? ? f.title : 'Untitled',
              :description => f.description.present? ? f.description : nil,
              :origin_poid => f.id,
              :tag_list => 'Flickr, ' + f.tags.gsub(/\W/, ','),
              :created_at => f.datetaken
            )
          else
            Video.create(
              :title => f.title.present? ? f.title : 'Untitled',
              :description => f.description.present? ? f.description : nil,
              :origin_poid => f.id,
              :origin => 'flickr',
              :tag_list => 'Flickr, ' + f.tags.gsub(/\W/, ','),
              :created_at => f.datetaken
            )
          end
        end
        page += 1
      end
    end
  end

  namespace :posts do
    desc 'posts from posterous'
    task :posterous => :environment do
      Posterous::Site.primary.posts.each do |post|
        Post.create(
          :headline => post.title,
          :body => post.body_full,
          :origin_poid => post.id,
          :origin => 'posterous',
          :created_at => post.display_date,
          :tag_list => post.tags.map{|t| t['name']}.join(',')
        )
      end
    end
    namespace :comments do
      desc 'assign comments to posts'
      task :associate => :environment do
        # if email
          #  create new user with email
        # else
          # create new user with sequence@simeons.net
        puts "parse csv"

      end
    end
  end

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
            :icon => c.beer_stamp == 'https://untappd.s3.amazonaws.com/site/assets/images/temp/badge-beer-default.png' ? nil : c.beer_stamp,
            :tag_list => 'Untappd'
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
            Daily.create(:created_at => DateTime.parse(img.attributes['alt'].text), :origin_poid => img.attributes['src'].text.split('/')[2].to_i, :tag_list => 'Momentile')
          end 
        end 
      end 
    end
  end
end
