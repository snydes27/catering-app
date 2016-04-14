class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :billing_name
      t.text :delivery_address
      t.text :billing_address
      t.string :email
      t.string :payment_type
      t.integer :phone
      t.date :delivery_date
      t.time :delivery_time
      t.integer :total_people
      t.text :delivery_notes
      t.decimal :delivery_fee
      t.string :discount_code
      t.decimal :fuel_fee
      t.decimal :discount

      t.timestamps null: false
    end
  end
end
