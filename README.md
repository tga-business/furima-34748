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
text     |text        |NOT NULL|
user     |references  |NOT NULL|
product  |references  |NOT NULL|
|--------|------------|--------|
|belongs_to :user              |
|belongs_to :product           |

##user
|Column     |Typ    |Options |
|-----------|-------|--------|
|email      |string |NOT NULL|
|password   |string |NOT NULL|
|first_name |string |NOT NULL|
|last_name  |string |NOT NULL|
|first_kana |string |NOT NULL|
|last_kana  |string |NOT NULL|
birth_year  |      |         |
birth_month |      |         |
birth_day   |      |         |