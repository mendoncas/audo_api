class CreateCompletedDisciplines < ActiveRecord::Migration[6.1]
  def change
    create_table :completed_disciplines do |t|
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :discipline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
