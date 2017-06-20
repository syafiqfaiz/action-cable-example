# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages
  validates :username, presence: true, uniqueness: true
end
