class AddDescriptionToLegoSets < ActiveRecord::Migration[7.1]
  def change
    add_column :lego_sets, :description, :string
  end
end
