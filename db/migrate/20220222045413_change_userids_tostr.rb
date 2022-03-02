class ChangeUseridsTostr < ActiveRecord::Migration[6.1]
  def change
    change_column :storage_keys, :user_id, :string
    change_column :sign_ins, :user_id, :string
  end
end
