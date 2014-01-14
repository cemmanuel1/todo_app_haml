require 'spec_helper'

describe "Todo View", js: true do
  let!(:todo) {create :todo}
  context "visit homepage" do
    it "shows a list of todos" do
      visit root_path
      expect(page).to have_content(todo.title)
    end
  end

  context "create todo" do
    it "creates of a new todo" do
      visit root_path
      create_todo("New Year's Resolution")
      expect(page).to have_content "New Year's Resolution"
    end
  end

  context "delete todo" do
    it "removes the todo" do
      visit root_path
      click_on 'X'
      page.driver.browser.switch_to.alert.accept
      expect(page).not_to have_content(todo.title)
    end
  end
end
