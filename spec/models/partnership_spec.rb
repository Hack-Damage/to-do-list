require 'rails_helper'

RSpec.describe Partnership, type: :model do

 	it "should contain a friender_id and friendee_id"  do
		@partnership = Partnership.create(
          friender_id: '1', 
          friendee_id: '1'
      ) 
	  expect(@partnership.friender_id).to eq(1)
	  expect(@partnership.friendee_id).to eq(1)
 end


end
