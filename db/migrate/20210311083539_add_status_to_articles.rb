class AddStatusToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :status, :string
    # add_foreign_key :articles, :authors
    # remove_foreign_key :accounts, name: :special_fk_name
    # rails db:migrate, db:rollback
    # db:migrate:up, db:migrate:down
    

  end
end
