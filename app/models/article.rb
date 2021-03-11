# rails generate model Article title:string body:text
# rails generate model XXmodel field1 field2

# define a migration:
#class CreateArticles < ActiveRecord::Migration[6.1]
#    def change
#      create_table :articles do |t|
#        t.string :title
#        t.text :body
#  
#        t.timestamps
#      end
#    end
#  end
# +++++++++++++++++++++++++
# migrate: rails db:migrate

# open a irb console: rails console
# create a record:
# article=Article.new(title: "", body: "")
# article.save

# search a record
# Article.all
# Article.find(1)



class Article < ApplicationRecord
    include Visible
    # self.table_name="my_products"

    has_many :comments, dependent: :destroy
    # validations
    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 10}

    # VALID_STATUSES = ['public', 'private', 'archived']

    # validates :status inclusion: { in: VALID_STATUSES }

    # def archived?
    #     status == 'archived'
    # end

end


