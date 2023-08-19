require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.') }
  let(:post) do
    Post.new(title: 'Hello', text: 'This is my first post', author: user, comments_counter: 0, likes_counter: 0)
  end
  subject { Like.new(author: user, post:) }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'increments the likes_counter of the associated post after saving' do
    expect { subject.save }.to change { post.reload.likes_counter }.by(1)
  end
end
