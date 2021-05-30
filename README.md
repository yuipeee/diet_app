# アプリケーション名
diet_app

# アプリケーション概要
ダイエットの記録がシェアできるアプリケーションを作成しました。
投稿者は『写真』『体重』『ひとこと』の3項目を投稿することができ、
投稿者に対しては、コメントやお気に入り登録をすることができます。

# 制作背景(意図)
ダイエットを持続できないという声をよく耳にすることがありました。
そこで、一人ではなく誰かとシェアすることで、モチベーションを高め、
持続できるのではないかと考え、このアプリを作成しました。

# DEMO
## ユーザー登録
### 新規登録ページ
[![Image from Gyazo](https://i.gyazo.com/f75a44b40dbf563afde0f4a51924a1ac.gif)](https://gyazo.com/f75a44b40dbf563afde0f4a51924a1ac)

ニックネーム・メールアドレス・パスワードを入力することでユーザーの登録をすることができます。

### ログインページ
[![Image from Gyazo](https://i.gyazo.com/8223ba786d3390065defccea53df4562.gif)](https://gyazo.com/8223ba786d3390065defccea53df4562)

ユーザーが一度登録した内容（メールアドレス・パスワード）を入力することで、ログインすることができます。

## 投稿一覧ページ
[![Image from Gyazo](https://i.gyazo.com/3d819532dcec96b9fd897a43a1ec7fe2.gif)](https://gyazo.com/3d819532dcec96b9fd897a43a1ec7fe2)

投稿内容を複数名でシェアすることができます。

### 投稿機能
[![Image from Gyazo](https://i.gyazo.com/53cfffe0ee1e1d1f40b36b37e741e738.gif)](https://gyazo.com/53cfffe0ee1e1d1f40b36b37e741e738)

写真・体重・ひとことの3項目を投稿することができ、
写真のみ任意投稿となっております。

### いいね機能
[![Image from Gyazo](https://i.gyazo.com/c66880e77fc826561dfadf36ac9faa2b.gif)](https://gyazo.com/c66880e77fc826561dfadf36ac9faa2b)

1つの投稿に対して1いいねすることができます。

# 投稿詳細ページ
## コメント機能
[![Image from Gyazo](https://i.gyazo.com/a5a58562f0866c3b41c3be8b237cddf1.gif)](https://gyazo.com/a5a58562f0866c3b41c3be8b237cddf1)

投稿者に対してコメントすることができます。

# マイページ
[![Image from Gyazo](https://i.gyazo.com/26fe32108bf2d397492861228263c22c.gif)](https://gyazo.com/26fe32108bf2d397492861228263c22c)

日々の入力した体重は線グラフで表示されて、
投稿した内容もグラフ下より確認することができます。

# 工夫したポイント
* chartkickを活用して体重の推移をグラフ化したこと。
<br>努力した結果が可視化されることでモチベーションに繋がると考え、記載しました。
* コメント機能・いいね機能を付けたこと。
<br>日々の記録を単にシェアするだけではダイエットを持続できない可能性があると思います。コメントやいいね機能をつけることで、自分以外の人にも見られているという危機感を持ち、持続できるのではないかと考え、記載しました。

# 使用技術（開発環境）
Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code 

# 課題や今後実装したい機能
* S3の設定
* 目標体重を設定する機能（現体重との差を可視化させる）
* 記録の催促をする機能

# DB設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| email              | string   | null: false  unique: true |
| encrypted_password | string   | null: false               |

### Association

- has_many :posts
- has_many :comments
- has_many :likes

## posts テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| weight           | integer    | null: false                    |
| text             | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_many :likes

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## likes テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post