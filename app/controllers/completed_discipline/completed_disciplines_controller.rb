class CompletedDiscipline::CompletedDisciplinesController < ApplicationController
  def index
    render json: { completed_disciplines: CompletedDiscipline.all }
  end

  def create
    @completed_discipline = CompletedDiscipline.new(student: Student.find_by(id: params[:student_id]),
                                                    discipline: Discipline.find_by(id: params[:discipline_id]))

    if @completed_discipline.save
      render json: { message: 'Disciplina completa com sucesso!', completed_discipline: @completed_discipline }
    else
      render json: { message: 'Houve uma falha ao completar essa disciplina.' }
    end
  end
end
