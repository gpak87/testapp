class AddColumUserPasswordToUsers < ActiveRecord::Migration[5.2]
  # def up
  #   add_column :users, :password_digest, :string
  # end
  #
  # def down
  #   remove_column :users, :password_digest
  # end

  def change
    add_column :users, :password_digest, :string
  end
end
