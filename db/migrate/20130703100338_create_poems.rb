class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.references :poet, index: true
      t.references :user, index: true
      t.string :content
      t.string :poet_name

      t.timestamps
    end
  end
end
