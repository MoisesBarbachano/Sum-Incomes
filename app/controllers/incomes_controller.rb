class IncomesController < ApplicationController
  ERROR_FILE = 'El archivo no pudo ser leído'.freeze

  def index
    @error_income if params[:error]
    items_incomes = []

    incomes = Income.includes(:item)
    incomes.each { |income| items_incomes << income.quantity_items * income.item.price }

    @sum_incomes = items_incomes.inject(0, :+)
    @incomes = incomes.includes(:buyer, :seller, :item) unless incomes.count.zero?
  end

  def upload
    file_content = read_file(income_params)
    redirect_to action: :index, error: ERROR_FILE unless file_content

    data_incomes = file_content.split(/[\r\n]+/)
    data_incomes.drop(1).each do |row|
      income = row.split(/[\t]+/)
      buyer_name = income[0]
      item_description = income[1]
      item_price = income[2].to_f
      quantity_items = income[3].to_f
      seller_address = income[4]
      seller_name = income[5]

      buyer = Buyer.find_or_create_by(name: buyer_name)
      item = Item.create_with(price: item_price)
                 .find_or_create_by(description: item_description)
      seller = Seller.create_with(address: seller_address)
                     .find_or_create_by(name: seller_name)

      Income.create(
        quantity_items: quantity_items,
        buyer_id: buyer.id,
        item_id: item.id,
        seller_id: seller.id
      )
    end

    redirect_to action: :index
  end

  private

  def read_file(file)
    if file.respond_to?(:read)
      file_content = file.read
    else
      logger.error "Bad file_data: #{file.class.name}: #{file.inspect}"
      return nil
    end

    file_content
  end

  def income_params
    params.fetch(:file)
  end
end
