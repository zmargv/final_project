# == Schema Information
#
# Table name: p_votes
#
#  id         :integer          not null, primary key
#  up         :integer
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PVote < ApplicationRecord
    belongs_to :user
    belongs_to :post
    
    validates :up, :presence => true
end
