class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.belongs_to :user
      t.string :title, null: false
      t.text :context
      t.string :file_extension

      t.timestamps
    end
  end
end
