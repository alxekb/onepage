class User < ApplicationRecord
  has_many :records, dependent: :destroy
  attr_accessor :id, :username

  validates :username, presence: true
end
