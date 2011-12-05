Given /^I have a new "([^"]*)" with the "([^"]*)" "([^"]*)"$/ do |moment, attribute, value|
  # Build moment as a factory than coerce into a hash without primary key or timestamp members
  hash = Factory.build(moment.to_sym, attribute.to_sym => value).serializable_hash(:except => [:id,:created_at,:updated_at])
  @moment = {moment.to_sym => hash}
end

When /^I make an authenticated request to create the "([^"]*)"$/ do |moment|
  url = send("#{moment.pluralize}_url".to_sym) 
  post "#{url}?auth_token=#{@admin.authentication_token}", @moment.to_json
end

When /^I visit a "([^"]*)" with the "([^"]*)" "([^"]*)"$/ do |moment, attribute, value|
  new_moment = Factory(moment.to_sym, attribute.to_sym => value)
  @moment = moment == 'post' ? new_moment : new_moment.decorate
  visit send("#{moment}_url".to_sym, @moment) 
end

When /^I visit the index of "([^"]*)"$/ do |moments|
  @moments = (0..10).inject([]) { |arr, n| arr << Factory(moments.singularize.to_sym).decorate }
  visit send("#{moments}_url".to_sym)
end

When /^I know SDN has a "([^"]*)" with the "([^"]*)" "([^"]*)"$/ do |moment, attribute, value|
  @moment = Factory(moment.to_sym, attribute.to_sym => value).decorate
end

Then /^SDN displays the "([^"]*)"$/ do |moments|
  src = false
  case moments
    when 'beers'
      attrs = [:name, :brewery, :description]
    when 'videos'
      attrs = [:title, :description]
    when 'photos'
      attrs = [:title, :description]
      src = true
    when 'posts'
      attrs = [:headline, :body]
    when 'dailies'
      attrs = [:created_at]
      src = true
    when 'songs'
      attrs = [:title, :artist, :listen]
  end
  # Only look for moments on first page in reverse order because of default scope
  @moments.reverse[0..9].each do |moment|
    page.should have_selector("img[src='#{moment.src}']") if src
    attrs.each do |attr|
      page.should have_content(moment.send(attr)) 
    end
  end
end

Then /^SDN displays the "([^"]*)" with the "([^"]*)" "([^"]*)"$/ do |moment, attribute, value|
  page.should have_content(value)
end

Then /^the "([^"]*)" is created$/ do |moment|
  last_response.status.should == 201
end

Then /^the request is not accepted$/ do
  last_response.status.should == 406
end

Then /^the response should be unauthorized$/ do
 last_response.status.should == 401
end

Then /^the "([^"]*)" "([^"]*)" is shortened to an abstract$/ do |moment, attribute|
  content = @moment.send(attribute)
  page.should have_content(content[0..10].chop)
  page.should_not have_content(content)
end

When /^I visit a "([^"]*)"$/ do |moment|
  @moment = Factory(moment.to_sym)
  visit send("#{moment}_url".to_sym, @moment) 
end

Then /^SDN displays pagination$/ do
  # <span class="page current">1</span>  
  find('span.current').should have_content('1')
  # <a href="/?page=2" rel="next">2</a>
  find('a[rel="next"]').should have_content('2')
end

