class CreateInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :instruments do |t|
      t.integer :rsvp_id
      t.string :name

      t.timestamps
    end
  end
end
