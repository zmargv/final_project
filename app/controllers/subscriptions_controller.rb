class SubscriptionsController < ApplicationController
  respond_to :html, :js
  
  def unsubscribe
    @subscription = Subscription.find(params[:sub_id])

    delete_status = @subscription.destroy;
    
    if delete_status == true
      respond_to do |f|
        f.js {render('subscriptions/unsubscribe.js.erb')}
      end
    end
  end
  
  def index
    @subscriptions = Subscription.all

    render("subscriptions/index.html.erb")
  end

  def show
    @subscription = Subscription.find(params[:id])

    render("subscriptions/show.html.erb")
  end

  def new
    @subscription = Subscription.new

    render("subscriptions/new.html.erb")
  end

  def create
    @subscription = Subscription.new

    @subscription.user_id = params[:user_id]
    @subscription.topic_id = params[:topic_id]

    save_status = @subscription.save
    
    if save_status == true
      respond_to do |f|
        f.js {render('subscriptions/subscribe.js.erb')}
      end
    end
  end

  def edit
    @subscription = Subscription.find(params[:id])

    render("subscriptions/edit.html.erb")
  end

  def update
    @subscription = Subscription.find(params[:id])

    @subscription.user_id = params[:user_id]
    @subscription.topic_id = params[:topic_id]

    save_status = @subscription.save

    if save_status == true
      redirect_to("/subscriptions/#{@subscription.id}", :notice => "Subscription updated successfully.")
    else
      render("subscriptions/edit.html.erb")
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])

    @subscription.destroy

    if URI(request.referer).path == "/subscriptions/#{@subscription.id}"
      redirect_to("/", :notice => "Subscription deleted.")
    else
      redirect_to(:back, :notice => "Subscription deleted.")
    end
  end
end
