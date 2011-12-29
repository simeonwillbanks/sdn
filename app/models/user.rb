# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :encryptable, lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :website, :email, :password, :password_confirmation, :remember_me

  validates_presence_of :name
  validates_format_of :website, :with => URI::regexp(%w(http https)), :if => lambda { website? }

  has_many :comments
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  admin                  :boolean         default(FALSE)
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  authentication_token   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

