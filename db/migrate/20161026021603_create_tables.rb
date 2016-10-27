class CreateTables < ActiveRecord::Migration
  #creating a many-to-many relationship between users and tickets
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.float :rating
      t.string :session_token

      t.timestamps
    end

    add_index :users, :email, unique: true

    create_table :games do |t|
      t.string :name
      t.date :date

      t.timestamps
    end

    create_table :tickets do |t|
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true
      t.integer :price
      t.string :ticket_type

      t.timestamps
    end
  end
end
