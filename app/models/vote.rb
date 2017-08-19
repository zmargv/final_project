# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  up            :integer
#  user_id       :integer
#  voteable_id   :integer
#  voteable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Vote < ApplicationRecord
    belongs_to :voteable, polymorphic: true
end
