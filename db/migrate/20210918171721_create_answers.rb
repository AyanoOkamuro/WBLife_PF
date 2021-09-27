class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.text :body, null: false
      t.string :image_id, null: false, default: ""

      t.timestamps
    end
  end
end
