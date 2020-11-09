require 'rails_helper'

RSpec.describe 'Create Income' do
  let(:buyer)   { FactoryBot.create :buyer, :snake}
  let(:seller)  { FactoryBot.create :seller }
  let(:item)    { FactoryBot.create :item }
  let(:income1) { FactoryBot.create :income, buyer: buyer, seller: seller, item: item }

  it 'is valid' do
    income1.save
    expect(income1).to be_valid
  end

  context 'when quantity_items is not a number' do
    let(:income1) { FactoryBot.create :income }
    it 'is not valid' do
      income2 = FactoryBot.build(:income, quantity_items: 'string')
      expect { income2.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end
end
