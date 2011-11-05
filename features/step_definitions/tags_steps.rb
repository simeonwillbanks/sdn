Given /^I have these tags I'd like to apply "([^"]*)"$/ do |tag_list|
  # @moment is a moment type rails params hash
  # When we want to add a member, we must update the moment type hash, so we introspect to get the key 
  @moment[@moment.keys.first].merge!(:tag_list => tag_list)
end

