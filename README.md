# README

## users
|Column          |Type  |Options   |
|nickname        |string|null:false|
|email           |string|null:false|
|password        |string|null:false|
|first_name      |string|null:false|
|family_name     |string|null:false|
|first_name_kana |string|null:false|
|family_name_kana|string|null:false|
|birth_date      |date  |null:false|

### Association
- has_many :items
- has_many :purchase_record

## items
|Column      |Type       |Options   |
|item_name   |string     |null:false|
|price       |integer    |null:false|
|category    |string     |null:false|
|brand       |integer    |null:false|
|image       |references |null:false|
|condition   |integer    |null:false|
|user_id     |string     |null:false|

### Association
- belongs_to :users
- has_one    :purchase_record

## purchase_record
|Column         |Type      |Options   |
|purchase_date  |string    |null:false|
|purchase_amount|string    |null:false|
|buyer          |references|null:false|
|user_id        |string    |null:false|
|item_id        |string    |null:false|

### Association
- belongs_to :users
- has_one    :items
- has_one    :shipping

## shipping
|Column   |Type  |Options   |
|adress   |string|null:false|
|post_code|string|null:false|
|city     |string|null:false|

### Association
- has_one :purchase_record