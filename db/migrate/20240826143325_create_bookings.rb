class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :rent_start
      t.date :rent_end
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :lego_set, null: false, foreign_key: true

      t.timestamps
    end
  end
end
