class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :game_name, presence: true

  has_many :coaches
  has_many :students
  has_many :orders
  has_many :comments
  has_many :chats
  has_many :room_users
  has_many :rooms, through: :room_users
end
