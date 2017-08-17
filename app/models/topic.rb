# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
    has_many :subscriptions, :dependent => :destroy
    has_many :posts, :dependent => :destroy
    
    has_many :subscribers, :through => :subscriptions, :source => :user
    
    validates :subject, :presence => true
    validates :name, :presence => true
    validates :name, :uniqueness => true
end
