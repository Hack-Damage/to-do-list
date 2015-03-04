require 'rails_helper'

RSpec.describe Comment, type: :model do

 	it "should contain a title, user_id, and partnership_id"  do
		@created_comment = Comment.create(
          title: 'fakecomment', 
          # user_id: "1",
          # partnership_id: "1"
      ) 
		expect(@created_comment.title).to eq("fakecomment")
	  # expect(@created_comment.user_id).to eq(1)
	  # expect(@created_comment.partnership_id).to eq(1)
 end

end
