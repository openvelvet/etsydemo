class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :city
      t.string :address
      t.string :state
      t.integer :zip_code

      t.timestamps
    end
  end
end
