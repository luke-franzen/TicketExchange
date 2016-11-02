# Completed step definition for tickets_view.feature

Given /^I am on the homepage of the TicketExchange site$/ do
  visit root_path
 end

 When /^I am not logged in$/ do
  begin
    loggedin = page.find_by_id("login-link")
  rescue Capybara::ElementNotFound
    click_link("logout-link")
  end
 end

 And /^I click "Iowa State Cyclones"$/ do
    #click_on("gameid_2")
    #click_link "Iowa State Cyclones"
    #page.find("#gameid_2").click
 end

 Then /^I should see all of the tickets on sale for the Iowa State Game$/ do
   tickets = Ticket.all
   page.all('table#ticket_table tr').count.should == tickets.length + 1
   end