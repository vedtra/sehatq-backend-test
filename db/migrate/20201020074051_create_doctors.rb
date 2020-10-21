class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.integer :hospital_id
      t.string :name
      t.time :time_start
      t.time :time_end

      t.timestamps
    end
  end
end
