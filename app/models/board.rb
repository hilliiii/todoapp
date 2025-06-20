# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true

  belongs_to :user
end
