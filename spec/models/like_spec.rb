require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:author) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(author: author, title: 'Hello', text: 'This is my first post') }
  let(:like1) { Like.create(post: post, author: author) }

    it 'Should create new like' do
      expect(like1).to be_an_instance_of(Like)
    end

    it 'Should check if likes counter is counting likes correctly in the post' do
      expect { like1 }.to change(post, :likes_counter).from(0).to(1)
    end
end
