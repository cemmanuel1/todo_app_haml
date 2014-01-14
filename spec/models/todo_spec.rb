require 'spec_helper'

describe Todo do
  let(:todo) {build :todo}
  subject {todo}
  it {should validate_presence_of :title}

  context "#save" do
    it "should save with a title" do
      todo.save
      expect(todo).to be_an_instance_of Todo
    end
  end
end
