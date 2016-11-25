Given (/^I am on the home page$/) do
  visit welcome_index_path
end

Given /^I am on the sign up page$/ do
  visit new_user_path
end

When /^I click sign up$/ do
  click_on("login-link")
end

When /^I click forgot password$/ do
  click_on("forgot-password-link")
end

Then /^I should be on the sign up page$/ do
  expect(page).to have_content("Sign Up")
end

And /^I click the sign up button$/ do
  click_on("sign-up-button")
end

When /^I click the reset password button$/ do
  click_on("reset-password-button")
end

Then /^I should be on the home page$/ do
    expect(page).to have_content("buy and sell tickets")
end

Then /^(?:|I )should see "([^\"]*)"$/ do |text|
    expect(page).to have_content(text)
end


When /^I fill out the signup form with the following attributes:$/ do |form_table|
  form_table.hashes.each do |form|
   fill_in('user_first_name', :with => form["first_name"])
   fill_in('user_last_name', :with => form["last_name"])
   fill_in('user_email', :with => form["email"])
   fill_in('user_password', :with => form["password"])
   fill_in('user_password_confirmation', :with => form["password_confirmation"])
  end
end

When /^I fill out the forgot password form with the following attributes:$/ do |form_table|
  form_table.hashes.each do |form|
    fill_in('password_reset_email', :with => form["email"])
  end
end