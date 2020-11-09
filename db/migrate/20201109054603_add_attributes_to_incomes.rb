class AddAttributesToIncomes < ActiveRecord::Migration[6.0]
  def change
    add_column :incomes, :quantity_items, :float
    add_reference :incomes, :buyer, null: false, foreign_key: true
    add_reference :incomes, :seller, null: false, foreign_key: true
    add_reference :incomes, :item, null: false, foreign_key: true
  end
end
