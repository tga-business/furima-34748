class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|
      t.string     :postal_code,      null: false
      t.string     :from_city,        null: false
      t.string     :from_address,     null: false
      t.string     :building
      t.string     :phone_number,     null: false 
      t.integer    :prefecture_id,    null: false
      t.references :purchase_history, foreign_key: true
      t.timestamps 
    end
  end
end
