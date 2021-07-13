class CreateDisciplines < ActiveRecord::Migration[6.1]
  def change
    create_table :disciplines do |t|
      t.string :name, null: false, unique: true
      t.string :description

      t.timestamps
    end
  end
end
