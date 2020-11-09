require 'rails_helper'

RSpec.describe 'Create Seller' do
  let(:seller1) { FactoryBot.create :seller }

  it 'is valid' do
    seller1.save
    expect(seller1).to be_valid
  end

  context 'when already exists' do
    let(:seller1) { FactoryBot.create :item }
    it 'is not valid' do
      seller1.save
      seller2 = FactoryBot.build(:item)
      expect { seller2.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end
end
