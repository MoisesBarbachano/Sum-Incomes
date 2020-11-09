require 'rails_helper'

RSpec.describe 'Create Item' do
  let(:item1) { FactoryBot.create :item }

  it 'is valid' do
    item1.save
    expect(item1).to be_valid
  end

  context 'when already exists' do
    let(:item1) { FactoryBot.create :item }
    it 'is not valid' do
      item1.save
      item2 = FactoryBot.build(:item)
      expect { item2.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end

  context 'when price is not a number' do
    let(:item1) { FactoryBot.create :item }
    it 'is not valid' do
      item2 = FactoryBot.build(:item, price: 'string')
      expect { item2.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end
end
