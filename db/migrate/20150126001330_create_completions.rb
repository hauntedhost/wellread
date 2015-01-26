class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.string :title
      t.text :summary
      t.integer :user_id
      t.integer :media_type
      t.text :link
      t.datetime :completed_at
      t.string :image

      t.timestamps null: false
    end
  end
end
