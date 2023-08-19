require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    @user = User.create(name: 'Tom & Jerry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Best friends',
                        posts_counter: 12)
    @post = Post.create(title: 'Physics', text: 'This is not my first post', comments_counter: 10, likes_counter: 10,
                        author: @user)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be empty' do
    subject.title = ' '
    expect(subject).to_not be_valid
  end

  it 'title should have valid value' do
    expect(subject.title).to eql 'Physics'
  end

  it 'text should have valid value' do
    expect(subject.text).to eql 'This is not my first post'
  end

  it 'comments_counter must be integer' do
    subject.comments_counter = 12
    expect(subject).to be_valid
  end

  it 'comments_counter must not be less than 1' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be integer' do
    subject.likes_counter = 12
    expect(subject).to be_valid
  end

  it 'likes_counter must not be less than 1' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Check the update_posts_counter, it should increments the posts_counter by 1' do
    author = User.create!(name: 'John Doe', posts_counter: 0)
    post = Post.new(title: 'Title', comments_counter: 0, likes_counter: 0, author:)
    expect { post.save! }.to change { author.reload.posts_counter }.by(1)
  end

  it 'Check recent_comments, it should return 5 recent comments' do
    expect(subject.recent_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
  end
end
