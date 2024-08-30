class AddNumPartsToLegoSets < ActiveRecord::Migration[7.1]
  def change
    add_column :lego_sets, :num_parts, :integer
  end
end
