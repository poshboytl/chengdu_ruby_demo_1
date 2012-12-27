# == Schema Information
#
# Table name: commits
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message    :text
#  revision   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Commit < ActiveRecord::Base
  attr_accessible :message, :revision
  belongs_to :user
end