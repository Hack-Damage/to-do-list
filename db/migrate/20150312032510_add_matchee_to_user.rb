class AddMatcheeToUser < ActiveRecord::Migration
  def change
    add_column :users, :matchee, :integer
  end
end
