class AddUserReferenceToLegoSets < ActiveRecord::Migration[7.1]
  def change
    add_reference :lego_sets, :user, null: false, foreign_key: true
  end
end
