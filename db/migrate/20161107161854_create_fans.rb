class CreateFans < ActiveRecord::Migration[5.0]
  def change
    create_table :fans do |t|
      t.string :username
      t.string :password
      t.string :name 
    end
  end
end
