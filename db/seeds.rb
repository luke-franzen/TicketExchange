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

users = [{:user_id => "jacksparrow", :user_first => "jack", :user_last => "sparrow", :email => "jack_sparrow@gmail.com"},
         {:user_id => "pizza", :user_first => "pizza", :user_last => "hut", :email => "pizza@gmail.com"},
         {:user_id => "ironman", :user_first => "tony", :user_last => "stark", :email => "tonystark@gmail.com"},
         {:user_id => "spiderman", :user_first => "peter", :user_last => "parker", :email => "peter_parker@gmail.com"}]

users.each do |user|
    User.create!(user)
 end