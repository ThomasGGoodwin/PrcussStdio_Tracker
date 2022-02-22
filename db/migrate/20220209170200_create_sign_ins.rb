class CreateSignIns < ActiveRecord::Migration[6.1]
  def change
    create_table :sign_ins do |t|
      t.integer :user_id
      t.integer :event_id
      t.datetime :signin_time
      t.boolean :attending
      t.string :reason

      t.timestamps
    end
  end
end
