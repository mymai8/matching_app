class CreateRoomCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :room_coaches do |t|
      t.references :room, null: false, foreign_key: true
      t.references :coach, null: false, foreign_key: true
      t.timestamps
    end
  end
end
