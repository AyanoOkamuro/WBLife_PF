class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  attachment :image

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def save_tag(sent_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = tags.pluck(:name) unless tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      tags.delete　Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      tags << new_post_tag
    end
  end

  validates :image, presence: true
end
