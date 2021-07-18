class Discipline < ApplicationRecord
  belongs_to :semester
  has_many :dependencies

  def generate_dot
    name + "->{#{
      Discipline.where(id:
      Dependency.where(dependency_id: id).pluck(:discipline_id))
      .pluck(:name).join(' ')
    }}"
  end

  # algoritmo de busca depth-first percorrendo a tabela de disciplinas e suas dependências
  def depends_on(dependency_id, set = [])
    set.push(id)

    dependencies.each do |dep|
      return true if dep.dependency_id == dependency_id

      dep.discipline.depends_on(dependency_id, set) unless set.include? dep.discipline_id
    end
    false
  end
end
