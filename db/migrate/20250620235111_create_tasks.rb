class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.references :board, null: false
      t.references :creator, null: false
      t.references :assignee
      t.string :title, null: false
      t.text :content
      t.date :deadline
      t.timestamps
    end

    add_foreign_key :tasks, :users, column: :creator_id
    add_foreign_key :tasks, :users, column: :assignee_id
    add_foreign_key :tasks, :boards, column: :board_id
  end
end
