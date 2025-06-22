# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  content     :text
#  deadline    :date
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  assignee_id :bigint
#  board_id    :bigint           not null
#  creator_id  :bigint           not null
#
# Indexes
#
#  index_tasks_on_assignee_id  (assignee_id)
#  index_tasks_on_board_id     (board_id)
#  index_tasks_on_creator_id   (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (assignee_id => users.id)
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (creator_id => users.id)
#
class Task < ApplicationRecord

  validates :title, presence: true

  belongs_to :board
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

end
