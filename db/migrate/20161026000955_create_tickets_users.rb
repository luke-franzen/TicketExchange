class CreateTicketsUsers < ActiveRecord::Migration
  def change
    create_table :tickets_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :ticket, index: true
    end
  end
end
