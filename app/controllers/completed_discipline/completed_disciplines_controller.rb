class CompletedDiscipline::CompletedDisciplinesController < ApplicationController
  def index
    render json: { completed_disciplines: CompletedDiscipline.all }
  end

  def show_by_student
    render json: Student.find_by(id: params[:student_id]).completed_disciplines
  end

  def create
    @completed = CompletedDiscipline.new(student: Student.find_by(id: params[:student_id]),
                                         discipline: Discipline.find_by(id: params[:discipline_id]))

    unless @completed.student.can_complete(params[:discipline_id])
      render json: { message:
        "#{@completed.student.name} não compre os requisitos para completar #{@completed.discipline.name}" }
    end
    if @completed.save
      render json: { message: 'Disciplina completa com sucesso!', completed_discipline: @completed }
    else
      render json: { message: 'Falha ao salvar dsiciplina' }
    end
  end
end
