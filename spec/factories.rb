FactoryGirl.define do
  factory :todo do
    title {Faker::Lorem.sentence(1)}
  end

  factory :task do
    task_item {Faker::Lorem.sentence(1)}
    todo
  end

  factory :complete_task, parent: :task do
    complete :true
  end
end
