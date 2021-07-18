class Student < ApplicationRecord
  has_many :completed_disciplines

  def can_complete(discipline_id)
    @discipline = Discipline.find_by(id: discipline_id)

    @discipline.dependencies.each do |dep|
      return false unless completed_disciplines.include? dep
    end

    true
  end

  def completable_disciplines
    @set = []
    @completed = completed_disciplines.pluck(:discipline_id)

    Discipline.all.each do |discipline|
      deps = discipline.dependencies.pluck(:dependency_id)
      # compara o tamanho da intercessão entre as dependências da disciplina e as disciplinas completas
      # com o tamanho do vetor de pendências da disciplinas
      @set.push(discipline) if ((@completed & deps).size == deps.size) && !@completed.include?(discipline.id)
    end

    # ordena todas as disciplinas completáveis pelo número do semestre 
    @set.sort_by!(&:semester_id)
  end
end
