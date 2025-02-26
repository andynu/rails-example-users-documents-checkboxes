class CreateUserDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :user_documents do |t|
      t.integer :user_id
      t.integer :document_id

      t.timestamps
    end
  end
end
