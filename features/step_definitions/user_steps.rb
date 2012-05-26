# encoding: utf-8
Given /^I am an admin$/ do
  @admin = FactoryGirl.create(:admin)
end

Given /^I am a user$/ do
  @user = FactoryGirl.create(:user)
end

Given /^I am a guest$/ do
  @user = nil
end

Given /^I am a signed in user$/ do
  @user = FactoryGirl.create(:user)
  visit new_user_session_url
  fill_in('Email', :with => @user.email)
  fill_in('Password', :with => "foobar")
  click_button('Sign in')
  page.should have_content('Signed in successfully.')
end

Given /^I am an authenticated admin$/ do
  @admin = FactoryGirl.create(:admin)
  visit new_user_session_url
  fill_in('Email', :with => @admin.email)
  fill_in('Password', :with => "foobar")
  click_button('Sign in')
  page.should have_content('Signed in successfully.')
end
