class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      
      t.string :title
      t.text :body
      t.integer :user_id
      
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
