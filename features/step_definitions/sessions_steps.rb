Given /^I am on the login page$/ do
  visit new_user_path
end

Given /^a user exists with the following attributes:$/ do |attribute_table|
  attribute_table.hashes.each do |attribute|
     user = User.new(:first_name => attribute[:first_name], :last_name => attribute[:last_name], :email => attribute[:email], :password => attribute[:password], :password_confirmation => attribute[:password_confirmation])
     user.save
  end
end

When /^I click login$/ do
  click_on("login-link")
end

Then /^I should be on the login page$/ do
    expect(page).to have_content("Sign Up")
end

And /^I click the log in button$/ do
  click_on("log-in-button")
end


When /^I fill out the login form with the following attributes:$/ do |form_table|
  form_table.hashes.each do |form|
   fill_in('session_email', :with => form["email"])
   fill_in('session_password', :with => form["password"])
  end
end