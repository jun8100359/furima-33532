class CreatePurchaseStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_street_addresses do |t|

      t.timestamps
    end
  end
end
