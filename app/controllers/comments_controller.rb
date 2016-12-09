class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy] 
  before_filter :basic
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    if @comment
      NoticeMailer.sendmail_confirm(comment_params).deliver
    end
    redirect_to blog_path(@blog)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
