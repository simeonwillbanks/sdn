Given /^I send and accept JSON$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

Then /^the response is a JSON hash with the key "([^"]*)" whose value is "([^"]*)"$/ do |key, value|
  page = JSON.parse(last_response.body)
  page[key].should == value
end

Then /^the JSON response should be an array with (\d+) "([^\"]*)" elements$/ do |number_of_children, name|
  page = JSON.parse(last_response.body)
  page.map { |d| d[name] }.length.should == number_of_children.to_i
end
