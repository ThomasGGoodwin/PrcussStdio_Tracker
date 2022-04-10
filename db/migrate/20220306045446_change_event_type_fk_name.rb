class ChangeEventTypeFkName < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :event_type, :event_type_id
  end
end
