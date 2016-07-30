class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :day_id
      t.string :name
      t.string :time
      t.timestamps(null: false)
    end
  end
end
