module Visible
    extend ActiveSupport::Concern

    VALID_STATUSES = ['public', 'private', 'archived']

    included do
        validates :status, inclusion: {in: VALID_STATUSES}
    end


    class_methods do
        def public_count
            #current model
            # Article.where(status: 'public').count
            # Comment.where(statis: 'public').count

            Article.where(status: 'public').count
            Comment.where(status: 'public').count


        end

        def comment_count
            Comment.count
        end
    end




    def archived?
        status == 'archived'
    end
end