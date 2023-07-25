require 'rails_helper'

RSpec.describe "Users features", type: :feature do

  describe "index page" do
    it "displays a list of users" do
      visit(users_path)
      sleep(5)
      expect(page).to have_content("Abdu")
    end
  end
end