require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'LaLa', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    @second_user = User.create(name: 'Marad', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Student from Vitnam.')
    @first_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
    @first_comment = Comment.create(post: @first_post, author: @second_user, text: 'Hi Denver!')
    @second_comment = Comment.create(post: @first_post, author: @second_user, text: 'Wow Denver!')
  end

  it "displays all post's data" do
    visit user_post_path(@first_user, @first_post)
    expect(page).to have_content(@first_post.title)
    expect(page).to have_content(@first_post.author.name)
    expect(page).to have_content(@first_post.comments_counter)
    expect(page).to have_content(@first_post.likes_counter)
    expect(page).to have_content(@first_post.text)
    expect(page).to have_content(@first_comment.author.name)
    expect(page).to have_content(@second_comment.author.name)
    expect(page).to have_content(@first_comment.text)
    expect(page).to have_content(@second_comment.text)
  end
end
