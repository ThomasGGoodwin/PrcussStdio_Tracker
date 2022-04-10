class AddInstrumentIdsToRsvps < ActiveRecord::Migration[6.1]
  def change
    add_column :rsvps, :instrument_ids, :int, array: true, default: []
  end
end
