password = "password123"
admin = User.create(:email => "admin@test.tld", :password => password, :password_confirmation => password)
admin.confirm!
admin.reset_authentication_token!
user = User.create(:email => "user@test.tld", :password => password, :password_confirmation => password)
user.confirm!
