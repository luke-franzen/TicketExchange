class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :game
      t.date :game_date
      t.int :price
      t.string :type
      
      t.timestamps
    end
  end
end
