class TopicsController < ApplicationController
  respond_to :html, :js
  def demo
    respond_to do |f|
      f.html { redirect_to tasks_url }
      f.js { render('topics/demo.js.erb') }
    end
  end
  
  def get_index
    @topics = Topic.all
  end
  def index
    @topics = Topic.all
    @subjects = @topics.map{|tpc| tpc.subject}.uniq

    render("topics/index.html.erb")
  end
  
  def show
    @topic = Topic.where(name: params[:name])[0]

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
      redirect_to("/r/#{@topic.name}", :notice => "Topic created successfully.")
    else
      render("topics/new.html.erb")
    end
  end

  def edit
    @topic = Topic.where(name: params[:name])[0]

    render("topics/edit.html.erb")
  end

  def update
    @topic = Topic.find(params[:id])

    @topic.name = params[:name]
    @topic.subject = params[:subject]

    save_status = @topic.save

    if save_status == true
      redirect_to("/r/#{@topic.name}", :notice => "Topic updated successfully.")
    else
      render("topics/edit.html.erb")
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    @topic.destroy

    if URI(request.referer).path == "/r/#{@topic.name}"
      redirect_to("/", :notice => "Topic deleted.")
    else
      redirect_to(:back, :notice => "Topic deleted.")
    end
  end
end
