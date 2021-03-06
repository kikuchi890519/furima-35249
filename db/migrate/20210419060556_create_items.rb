class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string    :name,               null: false, default: ""
      t.text      :details,            null: false
      t.integer   :price,              null: false
      t.integer   :category_id,        null: false
      t.integer   :condition_id,       null: false
      t.integer   :shipping_charge_id, null: false
      t.integer   :city_id,            null: false
      t.integer   :days_ship_id,       null: false
      t.references :user,              foreign_key:true

      t.timestamps
    end
  end
end