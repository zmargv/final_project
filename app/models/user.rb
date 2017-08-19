# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :subscriptions, :dependent => :destroy
  has_many :posts, :dependent => :nullify
  has_many :comments, :dependent => :nullify
  has_many :votes, :class_name => "PVote", :dependent => :destroy
  has_many :c_votes, :dependent => :destroy
  
  has_many :topics, :through => :subscriptions, :source => :topic
  
  validates :username, :length => { :minimum => 4, :maximum => 40 }
  validates :username, :presence => true
  validates :username, :uniqueness => true
end
