class CreateContainers < ActiveRecord::Migration[5.2]
  def change
    create_table :containers do |t|
      t.string :name
      t.string :description
      t.string :color
      t.integer :space_id

      t.timestamps
    end
  end
end
