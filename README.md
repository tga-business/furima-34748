# README


## products
  |Column                |Type        |Options          |
  |----------------------|------------|-----------------|
  |title                 |string      |null: false      |
  |description           |text        |null: false      |
  |category_id           |integer     |null: false      |
  |price                 |integer     |null: false      |
  |status_id             |integer     |null: false      |
  |prefecture_id         |integer     |null: false      |
  |burden_id             |integer     |null: false      |
  |esd_id                |integer     |null: false      |
  |user                  |references  |foreign_key: true|
  belongs_to :user
  has_one    :purchase_history
  has_many   :comments
  has_many   :statuses
  has_many   :prefectures
  has_many   :burdens
  has_many   :esds

# category
active_hash使用
カテゴリーを記述
belongs_to :product

# status
active_hash使用
商品の状態についての選択肢を記述予定
belongs_to :product

# prefecture
active_hash使用
都道府県記述


# esd
active_hash使用
発送日時の選択肢について記述


# burden
active_hash使用
発送料の負担について記述



# users
|Column               |Type    |Options                  |
|---------------------|--------|-------------------------|
|nickname             |string  |null: false              |
|email                |string  |unique: true, null: false|
|encrypted_password   |string  |null: false              |
|first_name           |string  |null: false              |
|last_name            |string  |null: false              |
|first_kana           |string  |null: false              |
|last_kana            |string  |null: false              |
|birth                |date    |null: false              |
has_many :purchase_histories
has_many :products


# street_address(住所)
|Column          |Type         |Options     |
|----------------|-------------|------------|
|postal_code     |string       |null:  false|
|from_city       |string       |null:  false|
|from_address    |string       |null:  false|
|building        |string       |            |
|phone_number    |string       |null:  false|
|prefecture_id   |integer      |null:  false|
|purchase_history              |references  |foreign_key: true|
 has_many :prefectures
 belongs_to :purchase_history


# purchase_histories(購入履歴)
|Column               |Type        |Options          |
|---------------------|------------|-----------------|
|product              |references  |foreign_key: true|
|user                 |references  |foreign_key: true|
 belongs_to :user
 belongs_to :product
 has_one  :street_address

##comment、creditは追加で実装
