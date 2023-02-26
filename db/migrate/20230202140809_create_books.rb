class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      #title=本のタイトル
      t.string :title
      #body=感想
      t.string :body
      # bookとユーザーIDを紐づける
      t.integer :user_id
      t.timestamps
    end
  end
end
