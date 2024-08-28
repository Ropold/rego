class ChangeLegoNrToBigint < ActiveRecord::Migration[7.1]
  def change
    change_column :lego_sets, :lego_nr, :bigint
  end
end
