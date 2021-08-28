class RemoveDeadlineFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :deadline, :date
  end
end
