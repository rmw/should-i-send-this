class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :user
      t.string :title, null: false
      t.text :context
      t.string :file_extension
      t.boolean :privacy, default: false

      t.timestamps
    end
  end
end
