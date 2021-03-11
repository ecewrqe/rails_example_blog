class MyValidator < ActiveModel::MyValidator
    
    def initialize(email)
        @email = email
    end

    def myValudate(record)
        # options[:fields]
        if record.first_name == "xxx"
            record. errors.add :base, "xxxxx"
        end
    end
end

class Product < ApplicationRecord
    # self.table_name = "my_products"
    # self.primary_key="product_id"
    # validates
    # validates :name, presence: true
    # Product.create().valid?
    # p = Person.new
    # p.errors.size
    # p.errors.objects.first.full_message
    # p.save!, Person.create!
    # Person.create.errors[:name].any?
    validates :name, acceptance: { 
        message: 'must be abided' 
        accept: ['x', 'y']
    }
    # confirm an email address or a password
    validates :email, confirmation: true
    # <%= text_field :person, :email %>
    # <%= text_field :person, :email_confirmation %>

    # exclusion:
    # validates :name, exclusion: { 
    #       in: %w(www us ca jp), 
    #       message: "%{value} is reserved."
    # }, include: {in:, message: }, length: {minimum, maximum, in, is}

    # format:
    # validates :name, format: { with: //, message: "" }
    # 
    # numericality:
    # validates :point, numericality: { only_integer: true, greater_than, eqaul_to, less_than, other_than, odd, even }
    # validates :email, uniqueness: true
    # validates :email, uniqueness: {scope: :year, message:}
    
    # validates_with MyValidator, fields: []

    # validate do |email|
    #     validates_with.new(email).validate
    # end

    # allow_blank, allow_nill, on: :create, on: :update
    # unless:, if:

    # validates_associated :books
    # =================================
    # errors
    # person.errors.full_messages: [xxx,xxx,xxx]
    # person.errors[:field]
    # error = person.errors.where(:name, :too_short)
    # error.attribute: :name， error.type: :too_short, error.options[:count]    
    # message and full_message
    # errors.add :field, message
    # errors.size
    # ===================================
    
    # callback
    before_validtion :ensure_login_has_a_value
    before_create do
        #function
    end

    # after_validation, before_save
    # after_create, after_commit
    # before_update, around_update
    # before_destroy

    # association:
    # has_many, belongs_to, has_one

    # migration: t.belongs_to :author, index: true, foreign_key: true


    private
        def ensure_login_has_a_value
            
        end
end

# Product.create(name: xxx, occcupation: "Code Articst")
# prod = Product.new
# prod.name = xxx
# prod.occupation = xxx

# user = User.new do |u|
#     u.name = "David"
#     u.occupation = "code artist"
# end

# user = User.all
# User.first, user.find_by(name: 'David')
# User.where(k1: v1, k2: v2).order(created_at: :desc)

# save a update: 
# User.save
# user.update(name: 'Dave')
# delete a record
# user.destroy

# User.update_all "x=1, y=2"
# User.destroy_all

