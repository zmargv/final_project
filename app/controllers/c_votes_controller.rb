class CVotesController < ApplicationController
  def index
    @c_votes = CVote.all

    render("c_votes/index.html.erb")
  end

  def show
    @c_vote = CVote.find(params[:id])

    render("c_votes/show.html.erb")
  end

  def new
    @c_vote = CVote.new

    render("c_votes/new.html.erb")
  end

  def create
    @c_vote = CVote.new

    @c_vote.up = params[:up]
    @c_vote.user_id = params[:user_id]
    @c_vote.comment_id = params[:comment_id]

    save_status = @c_vote.save

    if save_status == true
      redirect_to("/c_votes/#{@c_vote.id}", :notice => "C vote created successfully.")
    else
      render("c_votes/new.html.erb")
    end
  end

  def edit
    @c_vote = CVote.find(params[:id])

    render("c_votes/edit.html.erb")
  end

  def update
    @c_vote = CVote.find(params[:id])

    @c_vote.up = params[:up]
    @c_vote.user_id = params[:user_id]
    @c_vote.comment_id = params[:comment_id]

    save_status = @c_vote.save

    if save_status == true
      redirect_to("/c_votes/#{@c_vote.id}", :notice => "C vote updated successfully.")
    else
      render("c_votes/edit.html.erb")
    end
  end

  def destroy
    @c_vote = CVote.find(params[:id])

    @c_vote.destroy

    if URI(request.referer).path == "/c_votes/#{@c_vote.id}"
      redirect_to("/", :notice => "C vote deleted.")
    else
      redirect_to(:back, :notice => "C vote deleted.")
    end
  end
end
