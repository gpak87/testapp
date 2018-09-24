class CreateFleets < ActiveRecord::Migration[5.2]
  def change
    create_table :fleets do |t|
      t.references :user

      t.integer :lm
      t.integer :cm
      t.integer :kr
      t.integer :ow
      t.integer :panc
      t.integer :ni

      t.timestamps
    end
  end
end
