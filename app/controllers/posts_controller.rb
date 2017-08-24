class PostsController < ApplicationController
  def frontpage
    @posts = Post.all.order('updated_at DESC')

    render("posts/stream.html.erb")
  end
  
  def subscriptions
    @topics = current_user.topics
    @posts = @topics.map{|tpc| tpc.posts}.flatten
    @posts = @posts.sort!{|p| p.updated_at}
    
    render("posts/stream.html.erb")
  end
  
  def topic_specific
    @topic = Topic.where(:name => params[:topic_name])[0]
    @posts = @topic.posts.order('updated_at DESC')
    
    render("posts/stream.html.erb")
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
      redirect_to("/posts/#{@post.id}")
    else
      render("posts/stream.html.erb")
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    if URI(request.referer).path == "/posts/#{@post.id}"
      redirect_to("/", :notice => "Post deleted.")
    else
      redirect_to("/", :notice => "Post deleted.")
    end
  end
end
