require 'rails_helper'

RSpec.describe User, type: :model do
  let(:author) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post1) { Post.create(author: author, title: 'Hello one', text: 'This is my first post') }
  let(:post2) { Post.create(author: author, title: 'Hello two', text: 'This is my second post') }
  let(:post3) { Post.create(author: author, title: 'Hello three', text: 'This is my third post') }

    it 'Should create new author' do
      expect(author).to be_an_instance_of(User)
    end

    it 'Should check if name is empty' do
      author.name = nil
      expect(author).to_not be_valid
    end

    it 'Should check if posts counter is integer' do
      author.posts_counter = 3.5
      expect(author).to_not be_valid
    end

    it 'Should check if posts counter is integer' do
      expect(author).to be_valid
    end

    it 'Should check if posts counter is greater than or equal to 0' do
      author.posts_counter = -5
      expect(author).to_not be_valid
    end

    it 'should return the latest three posts of the user' do
      expect(author.recent_three).to include(post3)
    end

end
