class AddSectionToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :section, :string
    add_column :tickets, :row, :string
    add_column :tickets, :seat, :integer
  end
end
