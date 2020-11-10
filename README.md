# README  
  
# 概要  

テックキャンプの最終課題にて作成したアプリケーションを紹介します。また、自身が実装したオリジナル機能等についても紹介します。  
  
# アプリケーション情報
  
接続先情報  
https://furima28357.herokuapp.com/  
【Basic認証】  
ID: admin  
Pass: 2222  
【テスト用アカウント等】  
・購入者用  
メールアドレス:  hagijiro@jiro.com  
パスワード:  hagi222  
・購入用カード情報  
番号：4242424242424242  
期限：Sun Dec 20 2020 00:00:00 GMT+0900 (日本標準時)  
セキュリティコード：123  
・出品者用  
メールアドレス名: haginosuke@hagimail.com  
パスワード: hagi999  

# 開発状況  
【開発環境】  
Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code/Heroku  
【開発期間と平均作業時間】  
開発期間：8/8~9/2 (25日間)  
1日あたりの平均作業時間：9  
合計：230時間程度  

# 動作確認方法
WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。  
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。  
接続先およびログイン情報については、上記の通りです。  
同時に複数の方がログインしている場合に、ログインできない可能性があります。  
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品  
確認後、ログアウト処理をお願いします。  

# 最終課題を経ての気づき  
【工夫した点】  
なるべく自分の頭でどうJavaScriptを記述するのかを考えました。特に自信につながったのが、商品出品時の金額入力と同時に手数料と利益を出力させる機能です。  
試行錯誤を繰り返し記述方法を調整する事でJavaScriptの記述に慣れる事ができました。  
【苦労した点】  
アプリのモデルの作成時点で間違いをしてしまい、その間違いに気づくのが遅くなり修正に時間がかかってしまった事が苦労した事です。  
ユーザー管理機能をdeviseを用いて実装するはずが、誤ってuserの名前で自力でモデルを作ってしまったため、ログイン機能を作成するときにつまづいてしまい、後からdeviseを取り入れたが既存のuserモデルとごちゃ混ぜになりエラーが多発する事態となりました。  
やり直しも考えましたが、ひとつひとつエラーを紐解く事で乗り越える事ができました。時間はかかりましたが度重なるエラーと向き合える良い機会となりました。  
  
#テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| firstname_kanji       | string  | null: false |
| lastname_kanji        | string  | null: false |
| firstname_katakana    | string  | null: false |
| lastname_katakana     | string  | null: false |
| birth_day             | date    | null: false |



### Association

- has_many :items
- has_many :comments, through: items
- has_many :orders


## items テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| image      | string     | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false ,foreign_key: true |
| tax        | boolean    | null: false                    |
| text       | text       |                                |
| genre      | integer    | null: false                    |
| quality    | integer    | null: false                    |
| payment    | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| days       | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postal_code    | string     | null: false                   |
| prefecture     | integer    | null: false                   |
| city           | string     | null: false                   |
| house_number   | string     | null: false                   |
| building_name  | string     |                               |
| phone_number   | string     | null:false                    |
| order          | references | null:false, foreign_key: true |

### Association

- belongs_to :order
