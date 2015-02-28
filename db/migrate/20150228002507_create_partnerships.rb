class CreatePartnerships < ActiveRecord::Migration
  def change
    create_table :partnerships do |t|
      t.integer :friender_id
      t.integer :friendee_id

      t.timestamps null: false
    end
  end
end
