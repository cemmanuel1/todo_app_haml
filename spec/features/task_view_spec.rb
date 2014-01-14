require 'spec_helper'

describe 'Task View', js: true do

  context '#complete' do
    it 'mark todos complete' do
      visit root_path
      create_todo("Grocery List")
      create_task("Bananas")
      check 'task_complete'
      expect(page).to have_css(".completed_task")
    end
  end

  context "create and delete task" do
    it "removes the task" do
      visit root_path
      create_todo("Grocery List")
      create_task("Bananas")
      expect(page).to have_content("Banana")
      click_on 'X'
      page.driver.browser.switch_to.alert.accept
      expect(page).not_to have_content("Banana")
    end
  end
end
