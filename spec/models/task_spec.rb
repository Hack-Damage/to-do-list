require 'rails_helper'

RSpec.describe Task, type: :model do
	it "should contain a username, email, password, and matched status"  do
		@created_task = Task.create(
          name: 'MadeTask', 
          is_complete: "true",
          user_id: "1"
      ) 
		expect(@created_task.name).to eq("MadeTask")
	  expect(@created_task.is_complete).to eq(true)
	  expect(@created_task.user_id).to eq(1)
 end
end
