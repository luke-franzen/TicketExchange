Given(/^the following conversation exists:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
   table.hashes.each do |conversation|
    # Each returned movie will be a hash representing one row of the movies_table
    # The keys will be the table headers and the values will be the row contents.
    # Entries can be directly to the database with ActiveRecord methods
    # Add the necessary Active Record call(s) to populate the database.
    Conversation.create(conversation)
    end
end

And(/^I am in a conversation$/) do
    row = all('/tbody/tr/td')
end

When(/^I fill out the message box with text$/) do
  messages = all('//*[@id="MainContent"]/div/div[1]/div[2]/div[1]/div/div')
  
end

When(/^I click send$/) do
 
end

Then(/^I should see my new message sent$/) do
 
end