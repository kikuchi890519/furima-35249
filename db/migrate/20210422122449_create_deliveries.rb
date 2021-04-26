class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|

      t.string       :post_code,       null: false
      t.integer      :city_id,         null: false
      t.string       :municipality,    null: false
      t.string       :address,         null: false
      t.string       :building_name
      t.string       :phone_number,    null: false
      t.references   :purchase_record, foreign_key: true

      t.timestamps
    end
  end
end
