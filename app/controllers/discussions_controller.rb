class DiscussionsController < ApplicationController
  def index
    @discussions = Discussion.all
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.create(params.require(:discussion).permit(:title))
    if @discussion.valid?
      redirect_to @discussion
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @discussion = Discussion.find(params.require(:id))
  end
end
