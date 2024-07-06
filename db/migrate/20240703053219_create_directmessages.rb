class CreateDirectmessages < ActiveRecord::Migration[6.1]
  def change
    create_table :directmessages do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
