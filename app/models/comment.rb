# rails generate model Comment commenter:string body:text article:references

class Comment < ApplicationRecord
  include Visible
  belongs_to :article

  # VALID_STATUSES = ['public', 'private', 'archived']

  # validates :status, inclusion: { in: VALID_STATUSES }

  # def archived?
  #   status == 'archived'
  # end
  
end
