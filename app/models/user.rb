class User < ApplicationRecord
  has_many :records, dependent: :destroy

  validates :username, presence: true
end
