class Dependency < ApplicationRecord
  belongs_to :discipline

  def valid
    !(discipline.depends_on(dependency_id) || # checa se a dependência é redundante
      Discipline.find_by(id: dependency_id).depends_on(discipline.id) || # checa se a dependência é cíclica
      discipline.id == dependency_id) # checa se a dependência depende de si mesma
  end
end
