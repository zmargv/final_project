class TopicsController < ApplicationController
  def index
    @topics = Topic.all

    render("topics/index.html.erb")
  end

  def show
    @topic = Topic.find(params[:id])

    render("topics/show.html.erb")
  end

  def new
    @topic = Topic.new

    render("topics/new.html.erb")
  end

  def create
    @topic = Topic.new

    @topic.name = params[:name]
    @topic.subject = params[:subject]

    save_status = @topic.save

    if save_status == true
      redirect_to("/topics/#{@topic.id}", :notice => "Topic created successfully.")
    else
      render("topics/new.html.erb")
    end
  end

  def edit
    @topic = Topic.find(params[:id])

    render("topics/edit.html.erb")
  end

  def update
    @topic = Topic.find(params[:id])

    @topic.name = params[:name]
    @topic.subject = params[:subject]

    save_status = @topic.save

    if save_status == true
      redirect_to("/topics/#{@topic.id}", :notice => "Topic updated successfully.")
    else
      render("topics/edit.html.erb")
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    @topic.destroy

    if URI(request.referer).path == "/topics/#{@topic.id}"
      redirect_to("/", :notice => "Topic deleted.")
    else
      redirect_to(:back, :notice => "Topic deleted.")
    end
  end
end
