require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(author: author, title: 'Hello', text: 'This is my first post') }
  let(:comment1) { Comment.create(post: post, author: author, text: 'Hi 1 Tom!' ) }
  let(:comment2) { Comment.create(post: post, author: author, text: 'Hi 2 Tom!' ) }
  let(:comment3) { Comment.create(post: post, author: author, text: 'Hi 3 Tom!' ) }
  let(:comment4) { Comment.create(post: post, author: author, text: 'Hi 4 Tom!' ) }

    it 'Should create new post' do
      expect(post).to be_an_instance_of(Post)
    end

    it 'Should check if name is empty' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'Should check if comments counter is integer' do
      post.comments_counter = 3.5
      expect(post).to_not be_valid
    end

    it 'Should check if likes counter is integer' do
      expect(post).to be_valid
    end

    it 'Should check if comments counter is greater than or equal to 0' do
      post.comments_counter = -5
      expect(post).to_not be_valid
    end

    it 'should return the latest five comments of the post' do
      expect(post.recent_comments).to include(comment4)
    end

end
