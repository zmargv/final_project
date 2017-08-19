class PostsController < ApplicationController
  def frontpage
    @posts = Post.all

    render("posts/stream.html.erb")
  end
  
  def subscriptions
    @topics = current_user.topics
    @posts = @topics.map{|tpc| tpc.posts}.flatten
    
    render("posts/stream.html.erb")
  end
  
  def index
    @posts = Post.all

    render("posts/index.html.erb")
  end

  def show
    @post = Post.find(params[:id])

    render("posts/show.html.erb")
  end

  def new
    @post = Post.new

    render("posts/new.html.erb")
  end

  def create
    @post = Post.new

    @post.user_id = params[:user_id]
    @post.topic_id = params[:topic_id]
    @post.body = params[:body]
    @post.title = params[:title]
    @post.url = params[:url]

    save_status = @post.save

    if save_status == true
      redirect_to("/posts/#{@post.id}", :notice => "Post created successfully.")
    else
      render("posts/new.html.erb")
    end
  end

  def edit
    @post = Post.find(params[:id])

    render("posts/edit.html.erb")
  end

  def update
    @post = Post.find(params[:id])

    @post.user_id = params[:user_id]
    @post.topic_id = params[:topic_id]
    @post.body = params[:body]
    @post.title = params[:title]
    @post.url = params[:url]

    save_status = @post.save

    if save_status == true
      redirect_to("/posts/#{@post.id}", :notice => "Post updated successfully.")
    else
      render("posts/edit.html.erb")
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    if URI(request.referer).path == "/posts/#{@post.id}"
      redirect_to("/", :notice => "Post deleted.")
    else
      redirect_to(:back, :notice => "Post deleted.")
    end
  end
end
