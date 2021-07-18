class Student < ApplicationRecord
  has_many :completed_disciplines

  def can_complete(discipline_id)
    @discipline = Discipline.find_by(id: discipline_id)

    @discipline.dependencies.each do |dep|
      return false unless completed_disciplines.include? dep
    end

    true
  end
end
