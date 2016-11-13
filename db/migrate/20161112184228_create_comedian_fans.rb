class CreateComedianFans < ActiveRecord::Migration[5.0]
  def change
    create_table :comedian_fans do |t|
      t.integer :comedian_id
      t.integer :fan_id
    end
  end
end