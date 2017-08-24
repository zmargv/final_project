class TopicsController < ApplicationController
  respond_to :html, :js
  
  def get_index
    @topics = Topic.all
  end
  
  def index
    @topics = Topic.all
    @subjects = @topics.map{|tpc| tpc.subject}.uniq

    render("topics/index.html.erb")
  end
end
