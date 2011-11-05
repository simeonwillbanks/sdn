Given /^I have a new "([^"]*)" with the "([^"]*)" "([^"]*)"$/ do |moment, attribute, value|
  # Build moment as a factory than coerce into a hash without primary key or timestamp members
  hash = Factory.build(moment.to_sym, attribute.to_sym => value).serializable_hash(:except => [:id,:created_at,:updated_at])
  @moment = {moment.to_sym => hash}
end

When /^I make an authenticated request to create the "([^"]*)"$/ do |moment|
  path = send("#{moment.pluralize}_url".to_sym) 
  post "#{path}?auth_token=#{@admin.authentication_token}", @moment.to_json
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

