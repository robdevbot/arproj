class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :yes_no_maybe
      t.timestamps(null: false)
    end
  end
end
