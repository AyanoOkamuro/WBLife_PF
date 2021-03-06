class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :nices, dependent: :destroy

  # 与フォロー(自分がフォローする関係性)
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 自分がフォローしている人の参照
  has_many :followings, through: :relationships, source: :followed

  # 被フォロー(自分がフォローされる関係性)
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分をフォローしている人の参照
  has_many :followers, through: :reverse_of_relationships, source: :follower

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  # 論理削除
  def active_for_authentication?
    super && (is_deleted == false)
  end

  attachment :profile_image

  enum gender: { "男性": 0, "女性": 1, "その他": 2 }
  enum age: { "10代": 0, "20代": 1, "30代": 2, "40代": 3, "50代": 4, "60代以上": 5 }

  validates :nickname, presence: true

end
