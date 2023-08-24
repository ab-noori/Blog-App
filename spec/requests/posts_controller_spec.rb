require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get posts_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get posts_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get posts_path
      expect(response.body).to include('Posts for a User')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      post = Post.create(id: 1, title: 'Test Post 1')
      get post_path(post)
      expect(response).to have_http_status(:success)
    end
  
    it 'renders the show template' do
      post = Post.create(id: 2, title: 'Test Post 2')
      get post_path(post)
      expect(response).to render_template(:show)
    end
  
    it 'includes correct placeholder text in the response body' do
      post = Post.create(id: 3, title: 'Test Post 3')
      get post_path(post)
      expect(response.body).to include('Post Details')
    end
  end  
end
