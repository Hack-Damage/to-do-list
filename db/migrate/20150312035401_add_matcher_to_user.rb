class AddMatcherToUser < ActiveRecord::Migration
  def change
    add_column :users, :matcher, :integer
  end
end
