class AddSubjectToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :subject, :string
  end
end
