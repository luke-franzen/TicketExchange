class CreateTicketsUsers < ActiveRecord::Migration
  #creating a many-to-many relationship between users and tickets
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :email
      t.string :password
      t.float :rating
      t.string :session_token 
      
      t.timestamps
    end
    
    create_table :tickets do |t|
      t.string :game
      t.date :game_date
      t.int :price
      t.string :type
      
      t.timestamps
    end
    
    create_table :tickets_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :ticket, index: true
    end
  end
end
