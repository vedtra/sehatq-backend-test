class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :doctor_id
      t.time :time_start
      t.time :time_end

      t.timestamps
    end
  end
end
