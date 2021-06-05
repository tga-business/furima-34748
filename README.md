# README


##product
  |Column                |Type     |Options    |
  |----------------------|---------|-----------|
  |title                 |string   |null: false|
  |category              |text     |null: false|
  |price                 |integer  |null: false|
  |status_id             |integer  |null: false|
  |delivery_charge_id    |integer  |null: false|
  |from_id               |integer  |null: false|
  |burden_id             |integer  |null: false|
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



##user
|Column               |Type    |Options |
|---------------------|--------|------------|
|nickname             |string  |null: false|
|email                |string  |unique: true, null: false|
|encrypted_password   |string  |null: false|
|first_name           |string  |null: false|
|last_name            |string  |null: false|
|first_kana           |string  |null: false|
|last_kana            |string  |null: false|
|birth                |date    |null: false|
|product_id           |date    |null: false|


##住所
|Column          |Type   |Options |
|----------------|-------|--------|
|postal_code     |string       |null:  false|
|from_city       |string       |null:  false|
|from_address    |integer      |null:  false|
|building        |string       |            |
|phone_number    |string       |null:  false|
|from_id         |integer      |null:  false|
has_many :from


##Purchase history(購入履歴)
|Column               |Type    |Options |
|---------------------|--------|------------|
|product_id           |integer  |
|user_id              |integer  |



##comment、creditは追加で実装