class User < ApplicationRecord
validates :name, presence: true
  #validates 検証するカラム名：　precenceで空の投稿を防ぐ

EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i    #Regex正規表現
validates :email, presence: true,
       length: { maximum: 255 },
       format: { with: EMAIL_REGEX }, #属性の値が正規表現とマッチするか
         
       uniqueness: { case_sensitive: false } #重複の検証では大文字小文字の区別をしない
before_save { email.downcase! } #コールバック　saveする前に 大文字を小文字に変換　!＝＞破壊的メソッド　オブジェクト自体を変更

has_secure_password   #passwordをdigest化してデータベースに保存する

# validates :password, precence: true, length: {minimum: 6}


end
