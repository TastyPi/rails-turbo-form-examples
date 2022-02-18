class PostsController < ApplicationController
  def create
    post = Post.create(params.require(:post).permit(:discussion_id, :text))
    if post.valid?
      redirect_to post.discussion
    else
      @discussion = post.discussion
      @new_post = post
      render "discussions/show", status: :unprocessable_entity
    end
  end
end
