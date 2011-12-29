# encoding: utf-8
When /^I visit the home page$/ do
  visit root_url
end

When /^SDN has a variety of moments$/ do
  @moments = (1..12).inject([]) { |arr, n| arr << Factory(:moment) }
end

