# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    #has_many :c_votes, :dependent => :destroy
    has_many :votes, as: :voteable, :dependent => :destroy
    
    validates :body, :presence => true
end
