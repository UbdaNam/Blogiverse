require 'rails_helper'

RSpec.describe "User's post index page", type: :feature do
  before(:each) do
    @first_user = User.create(name: 'LaLa', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    @first_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
    @second_post = Post.create(author: @first_user, title: 'Hello2', text: 'This is my second post')
    @third_post = Post.create(author: @first_user, title: 'Hello3', text: 'This is my third post')
    @fourth_post = Post.create(author: @first_user, title: 'Hello4', text: 'This is my fourth post')
    @fifth_post = Post.create(author: @first_user, title: 'Hello5', text: 'This is my fifth post')
    @first_comment = Comment.create(post: @first_post, author: @first_user, text: 'Hi Lala!')
  end

  it "displays all user's data" do
    visit user_posts_path(@first_user)
    expect(page).to have_content(@first_user.name)
    expect(page).to have_css("img[src='#{@first_user.photo}']")
    expect(page).to have_content(@first_user.posts_counter)
    expect(page).to have_content(@first_post.title)
    expect(page).to have_content(@first_post.text)
    expect(page).to have_content(@second_post.text)
    expect(page).to have_content(@third_post.text)
    expect(page).to have_content(@first_comment.text)
    expect(page).to have_content(@first_post.comments_counter)
    expect(page).to have_content(@first_post.likes_counter)
    expect(page).to have_selector('.pagination')
  end

  it "clicking on a user redirects to that user's show page" do
    visit user_posts_path(@first_user)
    click_link @first_post.text
    expect(current_path).to eq(user_post_path(@first_user, @first_post))
  end
end
