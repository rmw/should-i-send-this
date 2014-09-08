class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.belongs_to :document, null: false
      t.integer :version_number, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
