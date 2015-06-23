class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :start
      t.time :end
      t.references :user, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
