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
  @moment = Factory(moment.to_sym, attribute.to_sym => value)
  visit send("#{moment}_url".to_sym, @moment) 
end

When /^I visit the index of "([^"]*)"$/ do |moments|
  @moments = (1..3).inject([]) { |arr, n| arr << Factory(moments.singularize.to_sym) }
  visit send("#{moments}_url".to_sym)
end

Then /^SDN displays the "([^"]*)"$/ do |arg1|
  @moments.each do |moment|
    moment.serializable_hash(:except => [:id,:created_at,:updated_at]).each do |key, attribute| 
      page.should have_content(attribute) 
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

When /^I visit a "([^"]*)"$/ do |moment|
  @moment = Factory(moment.to_sym)
  visit send("#{moment}_url".to_sym, @moment) 
end
