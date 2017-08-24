class VotesController < ApplicationController
  def index
    @votes = Vote.all

    render("votes/index.html.erb")
  end

  def show
    @vote = Vote.find(params[:id])

    render("votes/show.html.erb")
  end

  def new
    @vote = Vote.new

    render("votes/new.html.erb")
  end

  def create
    if Vote.exists?(:user_id => params[:user_id],:voteable_id => params[:voteable_id],:voteable_type => params[:voteable_type])
      Vote.where(:user_id => params[:user_id],:voteable_id => params[:voteable_id],:voteable_type => params[:voteable_type]).map{|item| item.destroy}
    end
    @vote = Vote.new

    @vote.up = params[:up]
    @vote.user_id = params[:user_id]
    @vote.voteable_id = params[:voteable_id]
    @vote.voteable_type = params[:voteable_type]

    @vote.save
    
    redirect_to("/")
  end

  def edit
    @vote = Vote.find(params[:id])

    render("votes/edit.html.erb")
  end

  def update
    @vote = Vote.find(params[:id])

    @vote.up = params[:up]
    @vote.user_id = params[:user_id]
    @vote.voteable_id = params[:voteable_id]
    @vote.voteable_type = params[:voteable_type]

    save_status = @vote.save

    if save_status == true
      redirect_to("/votes/#{@vote.id}", :notice => "Vote updated successfully.")
    else
      render("votes/edit.html.erb")
    end
  end

  def destroy
    @vote = Vote.find(params[:id])

    @vote.destroy
    
    redirect_to("/", :notice => "Vote deleted.")
    
    #if URI(request.referer).path == "/votes/#{@vote.id}"
    #  redirect_to("/", :notice => "Vote deleted.")
    #else
    #  redirect_to(:back, :notice => "Vote deleted.")
    #end
  end
end
