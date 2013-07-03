class CreatePoets < ActiveRecord::Migration
  def change
    create_table :poets do |t|
      t.string :poet_name

      t.timestamps
    end
  end
end
