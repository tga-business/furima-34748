# README


##product
  |Column   |Type     |Options |
  |---------|---------|--------|
  |title    |string   |NOT NULL|
  |category |text     |NOT NULL|
  |price    |integer  |NOT NULL|

  belongs_to :user
  has_many   :comments
  has_many   :status
  has_many   :delivery_charge
  has_many   :from
  has_many   :burden

##status
active_hash使用
商品の状態についての選択肢を記述予定
belongs_to :product

##from
active_hash使用
都道府県記述


##esd
active_hash使用
発送日時の選択肢について記述


##burden
active_hash使用
発送料の負担について記述

##comments 
|Column  |Type        |Options |
|--------|------------|--------|
text     |text        |null: false|
user     |references  |null: false|
product  |references  |null: false|
|--------|------------|--------|
|belongs_to :user              |
|belongs_to :product           |

##user
|Column               |Type    |Options |
|---------------------|--------|------------|
|nickname             |string  |unique: true|
|email                |string  |unique: true|
|encrypted_password   |string  |null:  false|
|first_name           |string  |null:  false|
|last_name            |string  |null:  false|
|first_kana           |string  |null:  false|
|last_kana            |string  |null:  false|
|birth                |integer |date        |


credit
|Column          |Type   |Options |
|----------------|-------|--------|
|deadline_year   |integer       |null:  false        |
|deadline_month  |integer       |null:  false        |
|security_code   |integer  |下四桁、もしくは３桁のメソッド        |
|postal_code     |string       |null:  false|
|from_city       |string       |null:  false|
|from_address    |integer       |        |
|phone_number    |string       |null:  false|
has_many :from


##Purchase history
|Column               |Type    |Options |
|---------------------|--------|------------|
|product_id           |string  |unique: true|
|user_id              |        |

