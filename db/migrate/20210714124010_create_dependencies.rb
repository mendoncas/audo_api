class CreateDependencies < ActiveRecord::Migration[6.1]
  def change
    create_table :dependencies do |t|
      t.belongs_to :discipline
      t.integer :dependency_id

      t.timestamps
    end
  end
end
