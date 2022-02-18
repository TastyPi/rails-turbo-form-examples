class PostsController < ApplicationController
  def edit
    @post = Post.find(params.require(:id))
  end

  def update
    @post = Post.find(params.require(:id))
    if @post.update(params.require(:post).permit(:text))
      redirect_to @post.discussion
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
