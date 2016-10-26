class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :email
      t.string :password
      t.float :rating
      t.string :session_token 
      
      t.timestamps
    end
  end
end
