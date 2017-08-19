# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  topic_id   :integer
#  body       :text
#  title      :text
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
    belongs_to :user
    belongs_to :topic
    has_many :comments, :dependent => :destroy
    #has_many :votes, :class_name => "PVote", :dependent => :destroy
    has_many :votes, as: :voteable, :dependent => :destroy
    
    validates :title, :presence => true
    validates :body, :presence => true
end
