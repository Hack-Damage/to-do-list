require 'rails_helper'

RSpec.describe User, type: :model do


	it "should contain a username, email, password, and matched status"  do
			@created_user = User.create(
          username: 'fakeuser', 
          password: "fakepassword",
          email: "joe@joe1234.com", 
          is_matched: false
      ) 
		expect(@created_user.username).to eq("fakeuser")
	  expect(@created_user.email).to eq("joe@joe1234.com")
	  expect(@created_user.password).to eq("fakepassword")
	  expect(@created_user.is_matched).to eq(false)
 end
end
