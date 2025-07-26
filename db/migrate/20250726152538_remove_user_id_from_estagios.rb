class RemoveUserIdFromEstagios < ActiveRecord::Migration[8.0]
  def change
    remove_column :estagios, :user_id, :integer
  end
end
