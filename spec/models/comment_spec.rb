require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:author) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(author:, title: 'Hello', text: 'This is my first post') }
  let(:comment1) { Comment.create(post:, author:, text: 'This is my first comment') }

  it 'Should create new comment' do
    expect(comment1).to be_an_instance_of(Comment)
  end

  it 'Should check if comments counter is counting comments correctly in the post' do
    expect { comment1 }.to change(post, :comments_counter).from(0).to(1)
  end
end
