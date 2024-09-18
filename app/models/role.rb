class Role < ActiveHash::Base
  self.data = [
    { id: 1, name: 'コーチ' },
    { id: 2, name: '生徒' }
  ]

  include ActiveHash::Associations
  has_many :users
end
