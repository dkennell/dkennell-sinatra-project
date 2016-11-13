class CreateCds < ActiveRecord::Migration[5.0]
  def change
      create_table :cds do |t|
      t.string :name 
      t.integer :comedian_id
      t.string :year
    end
  end
end
