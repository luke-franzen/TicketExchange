
Given /^I am logged in as a valid user$/ do
  user = User.create(:first_name => "test", :last_name => "user", :email => "test@user.com", :password => "abc123", :password_confirmation => "abc123", :activated => true)
  visit new_user_path
  fill_in('session_email', :with => "test@user.com")
  fill_in('session_password', :with => "abc123")
  click_on("login-link")
end
