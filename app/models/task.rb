class Task < ActiveRecord::Base
  belongs_to :todo
  attr_accessible :task_item, :complete
  validates :task_item, presence: true

end
