# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:username) }

    it 'should not save without a username' do
      user = build(:user, username: nil)
      user.save

      expect(user.errors.messages).to be_present
      expect(user.new_record?).to be_truthy
    end

    it 'should save with valid username' do
      user = build(:user)
      user.save

      expect(user.new_record?).to be_falsey
    end
  end

  context 'associations' do
    subject { build(:user) }

    it { should have_many(:records) }
  end
end
