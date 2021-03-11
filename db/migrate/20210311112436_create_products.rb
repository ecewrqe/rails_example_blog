# rails generate migration AddPartNumberToProducts


class CreateProducts < ActiveRecord::Migration[6.1]
  def change

    create_table :products do |t|
      
      t.string :name

      t.string :name, null: false
      t.index :part_number
      # t.datetime
      # t.text :description
      # t.integer :publisher_id
      # t.string :publisher_type
      # t.boolean :single_issue
      
      # t.timestamps :create_at
      t.timestamps
    end
  end

end
