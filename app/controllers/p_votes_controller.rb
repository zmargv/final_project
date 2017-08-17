class PVotesController < ApplicationController
  def index
    @p_votes = PVote.all

    render("p_votes/index.html.erb")
  end

  def show
    @p_vote = PVote.find(params[:id])

    render("p_votes/show.html.erb")
  end

  def new
    @p_vote = PVote.new

    render("p_votes/new.html.erb")
  end

  def create
    @p_vote = PVote.new

    @p_vote.up = params[:up]
    @p_vote.user_id = params[:user_id]
    @p_vote.post_id = params[:post_id]

    save_status = @p_vote.save

    if save_status == true
      redirect_to("/p_votes/#{@p_vote.id}", :notice => "P vote created successfully.")
    else
      render("p_votes/new.html.erb")
    end
  end

  def edit
    @p_vote = PVote.find(params[:id])

    render("p_votes/edit.html.erb")
  end

  def update
    @p_vote = PVote.find(params[:id])

    @p_vote.up = params[:up]
    @p_vote.user_id = params[:user_id]
    @p_vote.post_id = params[:post_id]

    save_status = @p_vote.save

    if save_status == true
      redirect_to("/p_votes/#{@p_vote.id}", :notice => "P vote updated successfully.")
    else
      render("p_votes/edit.html.erb")
    end
  end

  def destroy
    @p_vote = PVote.find(params[:id])

    @p_vote.destroy

    if URI(request.referer).path == "/p_votes/#{@p_vote.id}"
      redirect_to("/", :notice => "P vote deleted.")
    else
      redirect_to(:back, :notice => "P vote deleted.")
    end
  end
end
