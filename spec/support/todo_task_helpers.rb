module TodoTaskHelpers

  def create_task(task_item)
    fill_in 'New Task Item', with: task_item
    click_button 'Add'
  end

  def create_todo(title)
    fill_in 'Title', with: title
    click_button 'Create Todo'
  end
end

RSpec.configure do |config|
  config.include TodoTaskHelpers
end
