# Completed step definition for tickets_view.feature

Given /^the following games have been added to Iowa Ticket Exchange:$/ do |games_table|
    games_table.hashes.each do |game|
        Game.create!(game)
    end
end

And /^I am on the homepage of the TicketExchange site$/ do
  visit welcome_index_path
 end

 When /^I am not logged in$/ do
  begin
    loggedin = page.find_by_id("login-link")
  rescue Capybara::ElementNotFound
    click_link("logout-link")
    visit welcome_index_path
  end
 end

 And /^I click "(.*?)"$/ do |game|
    game = Game.find_by_name(game)
    click_link('gameid_'+game.id.to_s)
 end

 Then /^I should see all of the tickets for that game$/ do
   tickets = Ticket.all
   page.all('table#ticket_table tr').count.should == tickets.length + 1
   end