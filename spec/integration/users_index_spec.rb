require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Alamr', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    @second_user = User.create(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Poland.')
  end

  it 'displays all users data' do
    visit users_path
    expect(page).to have_content(@first_user.name)
    expect(page).to have_css("img[src='#{@first_user.photo}']")
    expect(page).to have_content(@first_user.posts_counter)
    expect(page).to have_content(@second_user.name)
    expect(page).to have_css("img[src='#{@second_user.photo}']")
    expect(page).to have_content(@second_user.posts_counter)
  end

  it "clicking on a user redirects to that user's show page" do
    visit users_path
    click_link @first_user.name
    expect(current_path).to eq(user_path(@first_user))
  end
end
