When /^I create a commment which says "([^"]*)"$/ do |body|
  # save_and_open_page
  fill_in('comment[body]', :with => body)
  click_button('New Comment')
end

Then /^the "([^"]*)" displays the comment$/ do |comment|
  page.should have_no_content(comment)
end

Then /^I can not create a new comment$/ do
  page.should_not have_css 'form#new_comment'
end
