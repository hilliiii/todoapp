class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.references :task, null: false
      t.text :content
      t.timestamps
    end
  end
end
