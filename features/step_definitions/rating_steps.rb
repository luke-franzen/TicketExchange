
Given /^Two users exist and I am logged in as a valid user with the following attributes:$/ do |attribute_table|
  attribute_table.hashes.each do |attribute|
    user = User.new(:id => 2, :first_name => attribute[:first_name], :last_name => attribute[:last_name], :email => attribute[:email], :password => attribute[:password], :password_confirmation => attribute[:password_confirmation], :activated => attribute[:activated])
    user.save
    user = User.new(:id => 1, :first_name => attribute[:first_name], :last_name => attribute[:last_name], :email => "other@email.com", :password => attribute[:password], :password_confirmation => attribute[:password_confirmation], :activated => attribute[:activated])
    user.save
    visit new_user_path
    fill_in('session_email', :with => attribute["email"])
    fill_in('session_password', :with => attribute["password"])
  end
  click_on("log-in-button")
end

And /^I go to the corresponding conversation$/ do
  # fast workaround create other user so conversation works
  visit "/conversations/3/messages"
end