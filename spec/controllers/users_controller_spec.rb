require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	describe "GET #new" do
		it "returns http success" do
		get :new
		expect(response).to have_http_status(:success)
		end
	end


  	describe "GET #index" do
    	it "returns http success" do
      	get :index
      	expect(response).to have_http_status(:success)
    end
  end
	 
	describe "GET #new" do
    	it "returns http success" do
      	get :new
      	expect(response).to have_http_status(:success)
    end
  end	
	describe 'GET #index' do
    	context 'when user is logged in' do
    	it 'renders the Task page'
  	end
    	context 'when user is logged out' do
    	it 'redirects to welcome page'
  	end
end

	describe UsersController do 
 	 	it "GET #index show a list of user" do
    	User.create(email: 'jocelynakkurt@gmail.com', is_matched: 'nill')
    
 	 	end
	end

    describe 'a user without an email' do
      before do
        post :create
      end

 	end
end