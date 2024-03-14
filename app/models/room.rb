class Room < ApplicationRecord
  has_many :room_users
  has_many :room_coaches
  has_many :users, through: :room_users
  has_many :coaches, through: :room_coaches
end
