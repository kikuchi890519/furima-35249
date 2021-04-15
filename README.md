# README

## users
|Column                    |Type   |Options                |
|nickname                  |string |null:false, unique:true|
|email                     |string |null:false  unique:true|
|encrypted_password        |string |null:false             |
|first_name                |string |null:false             |
|family_name               |string |null:false             |
|first_name_kana           |string |null:false             |
|family_name_kana          |string |null:false             |
|birth_date                |date   |null:false             |

### Association
- has_many :items
- has_many :purchase_records

## items
|Column             |Type       |Options          |
|name          |string     |null:false       |
|details       |text       |null:false       |
|price              |integer    |null:false       |
|category_id        |integer    |null:false       |
|condition_id       |integer    |null:false       |
|shipping_charge_id |integer    |null:false       |
|city_id            |integer    |null:false       |
|days_ship_id       |integer    |null:false       |
|user               |reference  |foreign_key: true|

### Association
- belongs_to :user
- has_one    :purchase_record

## purchase_record
|Column         |Type         |Options          |
|user           |reference    |foreign_key: true|
|item           |reference    |foreign_key: true|

### Association
- belongs_to    :user
- belongs_to    :item
- has_one       :delivery

## deliveries
|Column             |Type      |Options          |
|post_code          |string    |null:false       |
|city_id            |integer   |null:false       |
|municipality       |string    |null:false       |
|address            |string    |null:false       |
|building_name      |string    |                 |
|phone_number       |string    |null:false       |
|purchase_record    |reference |foreign_key: true|

### Association
- belongs_to     :purchase_record