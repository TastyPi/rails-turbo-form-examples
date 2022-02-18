class PostsController < ApplicationController
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
