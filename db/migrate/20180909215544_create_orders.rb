class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :customer_name, null: false
      t.string :customer_address, null: false
      t.decimal :price
      t.decimal :discount
      t.decimal :tax
      t.decimal :total

      t.timestamps
    end
  end
end
