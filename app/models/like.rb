class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :update_post_likes_counter
  after_destroy :update_post_likes_counter

  private

  def update_post_likes_counter
    post.update_posts_counter
  end
end
