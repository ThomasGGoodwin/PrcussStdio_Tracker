class CreateStorageKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :storage_keys do |t|
      t.integer :storage_key_id
      t.integer :user_id

      t.timestamps
    end
  end
end
