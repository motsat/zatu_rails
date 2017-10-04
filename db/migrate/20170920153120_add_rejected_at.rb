class AddRejectedAt < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rejected_at, :datetime, null: true
  end
end
