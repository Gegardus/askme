class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.string :answer

      t.timestamps
    end
  end
end
