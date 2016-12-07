class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :rated_user
      t.belongs_to :rating_user
      t.integer :value
      t.timestamps null: false
    end

    add_index :ratings, [:rated_user_id, :rating_user_id], :unique => true
  end
end
