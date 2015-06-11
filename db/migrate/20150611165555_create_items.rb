class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.boolean :done
      t.date :done_by
      t.integer :importance_level
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :users
  end
end
