class AddColumnToCommentsAndPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user
    add_reference :posts, :user
    remove_column :comments, :nick
    remove_column :posts, :author
  end
end
