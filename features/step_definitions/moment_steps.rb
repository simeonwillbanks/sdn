Given /^I am an admin$/ do
  @admin = Factory(:admin)
end

When /^I make an authenticated request for a new moment$/ do
  post moments_path, :auth_token => @admin.authentication_token
  follow_redirect!
end

Then /^I am redirected$/ do
  last_response.should_not be_redirect
  last_request.env["HTTP_REFERER"].should include(moments_path)
end

Then /^I see the message "([^"]*)"$/ do |msg|
  last_response.body.should include(msg)
end

# Does not appear to hold session on subsequent request
# This step might need to be refactored
Given /^I am an authenticated admin$/ do
  @admin = Factory(:admin)
  visit new_user_session_url
  fill_in('Email', :with => @admin.email)
  fill_in('Password', :with => "foobar")
  click_button('Sign in')
end
