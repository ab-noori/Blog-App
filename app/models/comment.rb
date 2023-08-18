class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_comments_counter

  private

  def update_post_comments_counter
    post.increment!(:comments_counter)
  end
end
