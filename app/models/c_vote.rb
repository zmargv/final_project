# == Schema Information
#
# Table name: c_votes
#
#  id         :integer          not null, primary key
#  up         :integer
#  user_id    :integer
#  comment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CVote < ApplicationRecord
    belongs_to :user
    belongs_to :comment
end
