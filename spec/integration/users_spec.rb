require 'rails_helper'

RSpec.describe 'Users features', type: :feature do
  describe 'user index page' do
    before(:each) do
      @first_user = User.create(name: 'Alamr', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                bio: 'Teacher from Mexico.')
      @second_user = User.create(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                 bio: 'Teacher from Poland.')
    end

    it 'Displays all users data' do
      visit users_path
      expect(page).to have_content(@first_user.name)
      expect(page).to have_css("img[src='#{@first_user.photo}']")
      expect(page).to have_content(@first_user.posts_counter)
      expect(page).to have_content(@second_user.name)
      expect(page).to have_css("img[src='#{@second_user.photo}']")
      expect(page).to have_content(@second_user.posts_counter)
    end

    it "Clicking on a user redirects to that user's show page" do
      visit users_path
      click_link @first_user.name
      expect(current_path).to eq(user_path(@first_user))
    end
  end

  describe 'Single user show page' do
    before(:each) do
      @first_user = User.create(name: 'LaLa', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                bio: 'Teacher from Mexico.')
      @first_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
      @second_post = Post.create(author: @first_user, title: 'Hello2', text: 'This is my second post')
      @third_post = Post.create(author: @first_user, title: 'Hello3', text: 'This is my third post')
      @fourth_post = Post.create(author: @first_user, title: 'Hello4', text: 'This is my fourth post')
      @fifth_post = Post.create(author: @first_user, title: 'Hello5', text: 'This is my fifth post')
    end

    it "Displays all user's data" do
      visit user_path(@first_user)

      expect(page).to have_content(@first_user.name)
      expect(page).to have_css("img[src='#{@first_user.photo}']")
      expect(page).to have_content(@first_user.posts_counter)
      expect(page).to have_content(@first_user.bio)
      expect(page).to have_content(@third_post.text)
      expect(page).to have_content(@fourth_post.text)
      expect(page).to have_content(@fifth_post.text)
      expect(find_button('See all posts')).to be_truthy
    end

    it "Clicking on a user redirects to that user's show page" do
      visit user_path(@first_user)
      click_link @third_post.text
      expect(current_path).to eq(user_post_path(@first_user, @third_post))
    end

    it "Clicking on see all posts button will redirect to user's posts index page" do
      visit user_path(@first_user)
      click_link('See all posts')
      expect(current_path).to eq(user_posts_path(@first_user))
    end
  end
end
