require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comments_counter' do
    it 'increments the post comments_counter by 1' do
      user = User.create!(name: 'User Name', posts_counter: 0)
      post = Post.create!(author: user, title: 'Post Title', comments_counter: 0, likes_counter: 0)
      comment = Comment.new(author: user, post:, text: 'New comment')
      expect(post.comments_counter).to eq 0
      comment.save!
      post.reload
      expect(post.comments_counter).to eq 1
    end
  end
end
