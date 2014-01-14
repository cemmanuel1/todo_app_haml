require 'spec_helper'

describe Task do
  let(:task) {build :task}
  subject {task}
  it {should validate_presence_of :task_item}
  it {should belong_to :todo}

  context '#save' do
    it "saves with task with title" do
      expect {
        task.save
        }.to change(Task, :count).by(1)
      end
    end

  context "#complete" do
    it "should return false for new task" do
      expect(task.complete).to be_false
    end
  end
end
