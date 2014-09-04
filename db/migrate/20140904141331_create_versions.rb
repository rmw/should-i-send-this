class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.belongs_to :document
      t.integer :version_number
      t.text :content

      t.timestamps
    end
  end
end
