class AddHasProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hasProfile, :integer
  end
end
