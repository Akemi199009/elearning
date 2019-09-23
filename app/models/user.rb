class User < ApplicationRecord
validates :name, presence: true
  #validates 検証するカラム名：　precenceで空の投稿を防ぐ

has_secure_password   #passwordをdigest化してデータベースに保存する


EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i    #Regex正規表現
validates :email, presence: true,
       length: { maximum: 255 },
       format: { with: EMAIL_REGEX }, #属性の値が正規表現とマッチするか
         
       uniqueness: { case_sensitive: false } #重複の検証では大文字小文字の区別をしない

before_save { email.downcase! } #コールバック　saveする前に 大文字を小文字に変換　!＝＞破壊的メソッド　オブジェクト自体を変更

validates :password, length: {minimum: 8}, allow_nil: true

mount_uploader :image, ImageUploader

validate :image_size   #単数形

has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

has_many :passitive_relationships, class_name: "Relationship",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
                                    
has_many :following, through: :active_relationships,
                      source: :followed

has_many :followers, through: :passitive_relationships,
                      source: :follower

has_many :lessons, foreign_key: "user_id", dependent: :destroy

has_many :activities

def recent_activities(limit)
  activities.order('created_at DESC').limit(limit)
end


def follow(other_user)
  following << other_user
end

def unfollow(other_user)
  active_relationships.find_by(followed_id: other_user.id).destroy
end

def following?(other_user)
  following.include?(other_user)
end



private
#Custom validates
def image_size
  errors.add(:image, "should be less than 5NB") if image.size > 5.megabytes
end

end
