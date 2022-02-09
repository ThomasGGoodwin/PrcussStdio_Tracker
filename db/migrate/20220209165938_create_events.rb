class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :event_id
      t.integer :event_type
      t.string :name
      t.date :data
      t.time :start_time
      t.time :end_time
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
