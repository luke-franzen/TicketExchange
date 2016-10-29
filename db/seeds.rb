# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

games = [{:name => "Miami RedHawks", :date => "3-Sep-2016"},
         {:name => "Iowa State Cyclones", :date => "10-Sep-2016"},
         {:name => "North Dakota State Bison", :date => "17-Sep-2016"},
         {:name => "Northwestern Wildcats", :date => "1-Oct-2016"},
         {:name => "Wisconsin Badgers", :date => "22-Oct-2016"},
         {:name => "Michigan Wolverines", :date => "12-Nov-2016"},
         {:name => "Nebraska Cornhuskers", :date => "25-Nov-2016"}
    ]

games.each do |game|
    Game.create!(game)
end

#TODO: determine way to hash these passwords
users = [{:first_name => "Jack", :last_name => "Sparrow", :email => "jack_sparrow@gmail.com", :password => "password1", :password_confirmation => "password1"},
         {:first_name => "Pizza", :last_name => "Hut", :email => "pizza@gmail.com", :password => "password2", :password_confirmation => "password2"},
         {:first_name => "Tony", :last_name => "Stark", :email => "tonystark@gmail.com", :password => "password3", :password_confirmation => "password3"},
         {:first_name => "Peter", :last_name => "Parker", :email => "peter_parker@gmail.com", :password => "password4", :password_confirmation => "password4"}]

users.each do |user|
    User.create(user)
end

rnum = Random.new()
games.each do |game|
    game_obj = Game.find_by_name(game[:name])
    users.each do |user|
        user_obj = User.find_by_email(user[:email])
        user_obj.tickets << Ticket.create!(:game_id => game_obj.id, :price => rnum.rand(20..120), :ticket_type => "Student")
    end
end