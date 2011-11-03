Given /^I have a new "([^"]*)" with the "([^"]*)" "([^"]*)"$/ do |moment, attribute, value|
  # Use .to_json since POST request except params to be JSON string
  @moment = Factory(moment.to_sym, attribute.to_sym => value).to_json(:except => [:id, :created_at, :updated_at])
end

When /^I make an authenticated request to create the "([^"]*)"$/ do |moment|
  path = send("#{moment.pluralize}_url".to_sym) 
  post "#{path}?auth_token=#{@admin.authentication_token}", @moment 
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

