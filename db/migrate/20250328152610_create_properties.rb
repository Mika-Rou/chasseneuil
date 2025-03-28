class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :price_per_night
      t.integer :max_guests

      t.timestamps
    end
  end
end
