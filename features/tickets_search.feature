Feature: User should be able to view tickets for a specific game
  Scenario:  search for a specific game
      Given the following games have been added to Iowa Ticket Exchange:
                  | name                      |     date          |
                  | Miami RedHawks            |   "3-Sep-2016"    |
                  | Iowa State Cyclones       |   "10-Sep-2016"   |
                  | North Dakota State Bison  |   "17-Sep-2016"   |
                  | Northwestern Wildcats     |   "1-Oct-2016"    |
                  | Wisconsin Badgers         |   "22-Oct-2016"   |
                  | Michigan Wolverines       |   "12-Nov-2016"   |
                  | Nebraska Cornhuskers      |   "26-Nov-2016"   |
    
      And  I am on the homepage of the TicketExchange site
            When I search for "Iowa State Cyclones" and click search
            Then I should see all of the tickets for that game