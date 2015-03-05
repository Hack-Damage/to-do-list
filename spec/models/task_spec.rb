require 'rails_helper'

RSpec.describe Task, type: :model do
  #context will wrap up your test into one block organizes
  context "by default" do
    before do
      @created_task = Task.create(name: 'MadeTask') 
    end

  	it "should contain a name, and matched status"  do
  	  expect(@created_task.name).to eq("MadeTask") 
   	end

    it "is_complete should be false" do
      expect(@created_task.is_complete).to be_falsey
    end
  end

  describe "without a name" do
    before do
      @task = Task.new(name: nil)
      @task.valid?
    end

    it "returns an error, can't be blank" do
      expect(@task.errors[:name]).not_to include("can't be blank")
  	end
  end

  describe "with a duplicate name" do
    before do 
      Task.create(name: 'Carwash')
      @task = Task.new(name:'Carwash')
      @task.valid?  
    end

    it "is invalid with a duplicate name" do
      expect(@task.errors[:name]).to include("has already been taken")
	  end
  end  
    #The test does not pass because we do not have implented any code yet
end