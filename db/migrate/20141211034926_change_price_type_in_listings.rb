class ChangePriceTypeInListings < ActiveRecord::Migration
  def change
  	change_column :listings, :price, :string
  end
end
