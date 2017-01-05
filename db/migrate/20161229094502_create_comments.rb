class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.text :body
      t.integer :article_id
      t.datetime :date_created

      t.timestamps
    end
  end
end
