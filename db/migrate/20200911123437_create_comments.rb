class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :review_id
      t.string :body

      t.timestamps
    end
  end
end
