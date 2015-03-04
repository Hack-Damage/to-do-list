class AddDefaultValueToIsComplete < ActiveRecord::Migration
  def change
  	def up
  		change_column :tasks, :is_complete, :boolean, :default => false
	end

	def down
  		change_column :tasks, :is_complete, :boolean, :default => nil
	end
  end
end
