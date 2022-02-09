class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.integer :role_id
      t.string :role_description

      t.timestamps
    end
  end
end
