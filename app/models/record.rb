class Record < ApplicationRecord
  validates :a, :b, :cmd, :result, presence: true
  belongs_to :user
end
