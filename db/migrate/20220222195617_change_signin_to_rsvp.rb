class ChangeSigninToRsvp < ActiveRecord::Migration[6.1]
  def change
    rename_table :sign_ins, :rsvps
    rename_column :rsvps, :signin_time, :rsvp_time
  end
end
