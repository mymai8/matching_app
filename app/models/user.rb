class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :game_name, presence: true
  validates :role_id, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :role
    has_many :coaches
    has_many :students
    has_many :orders
    has_many :comments
    has_many :chats
    has_many :rooms
    has_many :directmessages
end
