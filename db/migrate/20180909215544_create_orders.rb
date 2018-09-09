class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :customer_name, null: false
      t.string :customer_address, null: false
      t.decimal :price, null: false
      t.decimal :discount, null: false
      t.decimal :tax, null: false
      t.decimal :total, null: false

      t.timestamps
    end
  end
end
