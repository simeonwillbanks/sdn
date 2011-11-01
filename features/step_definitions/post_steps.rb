Given /^I have a new post with the headline "([^"]*)"$/ do |headline|
  @post = Factory(:post, :headline => headline)
end

When /^I make an authenticated request to create the post$/ do
  post "#{posts_path}?auth_token=#{@admin.authentication_token}", {:headline => @post.headline, :body => @post.body}.to_json
end

Then /^the post is created$/ do
  last_response.status.should == 201
end

