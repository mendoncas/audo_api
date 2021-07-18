class Discipline::DisciplinesController < ApplicationController
  def index
    render json: { disciplines: Discipline.all }
  end

  def graph
    @dot = ''

    Semester.all.each do |semester| # gera um código dot para as disciplinas
      @dot += semester.generate_dot # dupla iteração. buscar maneira mais eficiente
    end

    redirect_to gen_link(@dot)
  end

  def create
    @discipline = Discipline.new(discipline_params)
    @discipline.semester = Semester.find_by(id: params[:semester_id])

    if !Discipline.find_by(name: @discipline.name).nil?
      render json: { message: 'Essa disciplina já existe' }

    elsif @discipline.save
      render json: { message: 'Disciplina criada com sucesso!', discipline: @discipline }

    else
      render json: { message: 'Houve uma falha na criação da disciplina.' }
    end
  end

  def update
    return unless Discipline.find_by(id: params[:discipline_id]).update(discipline_params)

    render json: { message: 'Dependência atualizada com sucesso!', changes: discipline_params }
  end

  private

  def discipline_params
    params.permit(:name, :description)
  end
end
