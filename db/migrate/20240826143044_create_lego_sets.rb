class CreateLegoSets < ActiveRecord::Migration[7.1]
  def change
    create_table :lego_sets do |t|
      t.integer :lego_nr
      t.string :set_name
      t.date :release_year
      t.float :price_per_day
      t.string :description

      t.timestamps
    end
  end
end
