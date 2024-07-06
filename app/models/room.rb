class Room < ApplicationRecord
  belongs_to :user
  belongs_to :coach
  has_many :directmessages, dependent: :destroy
end
