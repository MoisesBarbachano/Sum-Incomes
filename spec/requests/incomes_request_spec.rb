require 'rails_helper'

RSpec.describe 'Incomes', type: :request do
  let(:buyer)   { FactoryBot.create :buyer, :snake }
  let(:seller)  { FactoryBot.create :seller }
  let(:item)    { FactoryBot.create :item }
  let(:income)  { FactoryBot.create :income, buyer: buyer, seller: seller, item: item }

  describe "GET index" do
    it "assigns @sum_incomes" do
      income.save
      get '/incomes'
      expect(assigns(:sum_incomes)).to eq(20)
    end

    it "renders the index view" do
      get '/incomes'
      expect(response).to render_template('index')
    end
  end
end
