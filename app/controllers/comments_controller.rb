class CommentsController < ApplicationController
    # create a comment
    # /articles/3/comments
    def create
        puts "comments: create"
        @article = Article.find(params[:article_id]);
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    # delete /articles/:article_id/comments/:id
    def destroy
        # :article_id, :id

        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)

    end


    private def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
    end
end
