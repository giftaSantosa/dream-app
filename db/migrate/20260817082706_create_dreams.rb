class CreateDreams < ActiveRecord::Migration[8.1]
  def change
    create_table :dreams do |t|
      t.text :input
      t.date :date
      t.string :mood
      t.jsonb :interpretation
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.text :system_prompt

      t.timestamps
    end
  end
end
