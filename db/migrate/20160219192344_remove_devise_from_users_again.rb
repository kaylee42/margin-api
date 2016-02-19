class RemoveDeviseFromUsersAgain < ActiveRecord::Migration
  def change
  end
  remove_column :users, :current_sign_in_at
end
