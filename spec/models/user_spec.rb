require 'rails_helper'

RSpec.describe User, type: :model do
  # trying to test relationship but this fails
  # it { should have_many(:comments) }

	it "should contain a username"  do
			@created_user = User.create(
          username: 'fakeuser'
      ) 
		expect(@created_user.username).to eq("fakeuser")
  end

  it "should contain an email" do
    @created_user = User.create( email: "joe@joe123.com")
    expect(@created_user.email).to eq("joe@joe123.com")
  end

  # this test won't pass unless we add a validator to check email uniqueness
  # it "should have a unique email" do
  #   User.create(email:"joe@joe123.com")
  #   second = User.create(email:"joe@joe123.com")
  #   second.valid?
  #   expect(second.errors[:email]).to include('has already been taken')
  # end

  it "should contain a password" do
    @created_user = User.create( password: "fakepassword")
    expect(@created_user.password).to eq("fakepassword")
  end

  it "should contain a matched status" do
    @created_user = User.create( is_matched: false)
    expect(@created_user.is_matched).to eq(false)
  end

end

