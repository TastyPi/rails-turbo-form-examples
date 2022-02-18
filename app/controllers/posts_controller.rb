class PostsController < ApplicationController
  def create
    post = Post.create(params.require(:post).permit(:discussion_id, :text))
    respond_to do |format|
      format.html do
        if post.valid?
          redirect_to post.discussion
        else
          @discussion = post.discussion
          @new_post = post
          render "discussions/show", status: :unprocessable_entity
        end
      end
      format.turbo_stream do
        if post.valid?
          @post = post
          @new_post = Post.new(discussion_id: post.discussion_id)
        else
          @post = nil
          @new_post = post
          render status: :unprocessable_entity
        end
      end
    end
  end

  def edit
    @post = Post.find(params.require(:id))
  end

  def update
    @post = Post.find(params.require(:id))
    if @post.update(params.require(:post).permit(:text))
      respond_to do |format|
        format.html { redirect_to @post.discussion }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
