class AddSemesterToDisciplines < ActiveRecord::Migration[6.1]
  def change
    add_reference :disciplines, :semester, null: false, foreign_key: true
  end
end
