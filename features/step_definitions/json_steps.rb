Given /^I send and accept JSON$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

Then /^the response is a JSON hash with the key "([^"]*)" whose value is "([^"]*)"$/ do |key, value|
  page = JSON.parse(last_response.body)
  page[key].to_s.should == value
end

Then /^the JSON response should be an array with (\d+) "([^\"]*)" elements$/ do |number_of_children, name|
  page = JSON.parse(last_response.body)
  page.map { |d| d[name] }.length.should == number_of_children.to_i
end

Then /^an array of tags whose members are "([^"]*)"$/ do |tags|
  posted = tags.split(',').map(&:strip)
  page = JSON.parse(last_response.body)
  saved = page['tags'].map{|t| t['name']} 
  posted.size.should == saved.size
  posted.each { |tag| saved.should include tag }
end
