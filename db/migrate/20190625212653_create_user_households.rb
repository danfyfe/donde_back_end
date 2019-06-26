class CreateUserHouseholds < ActiveRecord::Migration[5.2]
  def change
    create_table :user_households do |t|
      t.integer :user_id
      t.integer :household_id
      t.timestamps
    end
  end
end
