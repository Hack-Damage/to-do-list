require 'rails_helper'

RSpec.describe Task, type: :model do
	it "should contain a name, and matched status"  do
		@created_task = Task.create(
          name: 'MadeTask', 
      ) 
		expect(@created_task.name).to eq("MadeTask")
	  expect(@created_task.is_complete).to eq(false)
 end
end
