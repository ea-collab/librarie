class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :postcode
      t.string :country
      t.string :age_group
      t.string :category

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
