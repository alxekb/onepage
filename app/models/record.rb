class Record < ApplicationRecord
  attr_accessor :id, :a, :b, :cmd, :user_id, :result

  validates :a, :b, :cmd, :result, presence: true
end
