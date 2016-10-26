class CreateTickets < ActiveRecord::Migration
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
    
    create_table :games do |t|
      t.string :name
      t.date :date
      
      t.timestamps
    end
    
    create_table :tickets do |t|
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true
      t.int :price
      
      t.timestamps
    end
  end
end
