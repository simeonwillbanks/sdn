# encoding: utf-8
When /^I create a commment which says "([^"]*)"$/ do |body|
  # save_and_open_page
  fill_in('comment[body]', :with => body)
  click_button('New Comment')
end

When /^I create a empty commment$/ do
  click_button('New Comment')
end

Then /^the "([^"]*)" displays the comment which says "([^"]*)"$/ do |moment, body|
  page.should have_content(body)
end

Then /^the "([^"]*)" alerts "([^"]*)"$/ do |moment, alert|
  page.should have_content(alert)
end

Then /^I can not create a new comment$/ do
  page.should_not have_css 'form#new_comment'
end
