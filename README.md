# EasyTag
![EasyTag-index](https://user-images.githubusercontent.com/59213808/77808660-99da8e80-70cf-11ea-8c33-c01757959cc8.jpg)

# 概要

# 制作背景
世の中を（少しでも）便利にするアプリを作ろうと考え、まず<b>「解決したい問題」</b>は何か探してみました。<br>
日常の中で<b>「不便」</b>に思うことはなんだろうなど考えながら帰宅し、ふと買い忘れがあることに気付きました。<br>
<br>
「あー、また忘れちゃったなぁ〜」<br>
<br>
それは以前から買おうと思っているのにお店に行くとつい忘れてしまうという私の悪い癖でした。<br>
友人に話してみると<b>「あるある！」「分かるー！」</b>など<b>共感する</b>声が聞かれました。<br>
身近で小さな問題ですが、みんなも思っているこの「不便」を解決してみよう！と考えたことが始まりでした。<br>
<br>
さてではこの「買い忘れ」、どのようにしたら<b>防止</b>できるのか考えます。<br>
そこで以前聞いたある主婦の方が行っている対策を思い出しました。<br>
<br>
その方は冷蔵庫に<b>小さなホワイトボードをかけ、よく使う食材、日用品などをマグネットに書き出し貼っていた</b>んです。<br>
さらにマグネットは<b>裏返しで貼ると色が変わり、今必要な物がひと目で分かる</b>ようになっていました。<br>
それを見たご主人が仕事帰りに「必要な物買ってきたよー」と<b>自発的に買ってきてくれた</b>ということもあったそうです。<br>
<br>
エピソードに感動した私は、この<b>「主婦の知恵」</b>を搭載したアプリを作れば<b>「不便」も改善できる</b>と思い制作に取り掛かりました。

# 機能

# アップデートについて
EasyTagをもっと便利にご利用いただくために、次の機能を実装したいと考えております。<br>
- メモにカテゴリー機能を追加
- メンバー検索にインクリメンタルサーチ機能を追加

他、レイアウトや細部のブラッシュアップなど日頃より改善していきます。

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :comments, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :group_users, dependent: :destroy
- has_many :groups, through: :group_users

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name|index|unique: true|
### Association
- has_many :group_users,dependent: :destroy
- has_many :users, through: :group_users
- has_many :comments,dependent: :destroy
- has_many :items
- has_many :likes, dependent: :destroy
- has_many :liked_items, through: :likes, source: :item

## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|group|references|foreign_key: true|
|user|references|foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|-----|
|group|references|foreign_key: true|
|user|references|foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|-----|
|group|references|foreign_key: true|
|user|references|foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user
- has_many :likes, dependent: :destroy
- has_many :liked_groups, through: :likes, source: :group

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|group|references|foreign_key: true|
|item|references|foreign_key: true|
### Association
- belongs_to :item
- belongs_to :group
