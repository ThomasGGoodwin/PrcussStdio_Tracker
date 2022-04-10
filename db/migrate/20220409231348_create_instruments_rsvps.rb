class CreateInstrumentsRsvps < ActiveRecord::Migration[6.1]
  def change
    create_table :instruments_rsvps do |t|
      t.references :rsvp, null: false, foreign_key: true
      t.references :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
