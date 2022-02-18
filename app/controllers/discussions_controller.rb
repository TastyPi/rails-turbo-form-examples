class DiscussionsController < ApplicationController
  def index
    @discussions = Discussion.all
  end

  def show
    @discussion = Discussion.find(params.require(:id))
    @new_post = Post.new(discussion_id: @discussion.id)
  end
end
