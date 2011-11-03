Given /^I am an admin$/ do
  @admin = Factory(:admin)
end

Given /^I am a user$/ do
  @user = Factory(:user)
end

Given /^I am a guest$/ do
  @user = nil
end

Given /^I am a signed in user$/ do
  @user = Factory(:user)
  visit new_user_session_url
  fill_in('Email', :with => @user.email)
  fill_in('Password', :with => "foobar")
  click_button('Sign in')
  page.should have_content('Signed in successfully.')
end

Given /^I am an authenticated admin$/ do
  @admin = Factory(:admin)
  visit new_user_session_url
  fill_in('Email', :with => @admin.email)
  fill_in('Password', :with => "foobar")
  click_button('Sign in')
  page.should have_content('Signed in successfully.')
end
