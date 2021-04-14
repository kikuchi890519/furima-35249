# README

## users
|Column                    |Type   |Options                |
|nickname                  |string |null:false, unique:true|
|email                     |string |null:false             |
|encrypted_password        |string |null:false             |
|first_name                |string |null:false             |
|family_name               |string |null:false             |
|first_name_kana           |string |null:false             |
|family_name_kana          |string |null:false             |
|birth_date                |date   |null:false             |

### Association
- has_many :items
- has_many :purchase_record

## items
|Column             |Type       |Options   |
|item_name          |string     |null:false|
|price              |integer    |null:false|
|category           |string     |null:false|
|image              |references |null:false|
|condition_id       |integer    |null:false|
|shipping_charge_id |integer    |null:false|
|delivery_area_id   |integer    |null:false|
|days_ship_id       |integer    |null:false|
|user_id            |string     |null:false|

### Association
- belongs_to :user
- has_one    :purchase_record

## purchase_record
|Column         |Type      |Options   |
|user_id        |string    |foreign_key: true|
|item_id        |string    |foreign_key: true|

### Association
- belongs_to    :user
- belongs_to    :item
- belongs_to    :delivery

## deliveries
|Column          |Type   |Options   |
|post_code       |string |null:false|
|city            |string |null:false|
|municipality    |string |null:false|
|address         |string |null:false|
|building_name   |string |null:false|
|phone_number    |string |null:false|

### Association
- has_one :purchase_record