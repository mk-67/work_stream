class RemoveMemoFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :memo, :string
  end
end
