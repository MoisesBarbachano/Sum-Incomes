require 'rails_helper'

RSpec.describe 'Create Buyer' do
  let(:buyer1) { FactoryBot.create :buyer, :snake }

  it 'is valid' do
    buyer1.save
    expect(buyer1).to be_valid
  end

  context 'when already exists' do
    it 'is not valid' do
      buyer1.save
      buyer2 = FactoryBot.build(:buyer, :plissken)
      expect { buyer2.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end
end
