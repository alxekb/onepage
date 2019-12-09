# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Record, type: :model do
  context 'validations' do
    subject { build(:record) }

    it { should validate_presence_of :a }
    it { should validate_presence_of :b }
    it { should validate_presence_of :cmd }

    it 'should not save without a params' do
      record = build(:record, a: nil, b: nil, cmd: nil, result: nil, user_id: nil)
      record.save

      aggregate_failures 'error messages' do
        expect(record.errors.full_messages.count).to eq 5
        expect(record.new_record?).to be_truthy
      end
    end

    it 'should accept valid record' do
      record = create(:record)

      expect(record.new_record?).to be_falsey
    end
  end

  context 'associations' do
    it { should belong_to :user }
  end
end
