class AddDueDateToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :dueDate, :datetime
  end
end
