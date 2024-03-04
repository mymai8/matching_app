class Student < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :rank

  with_options presence: true do
    validates :rank_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :kill_rate
    validates :character
    validates :play_time
    validates :play_device
    validates :communication_tool
    validates :price
    validates :times_to_teach
    validates :enthusiasm_text
  end
  
  belongs_to :user
end
