class Discipline::DisciplinesController < ApplicationController
  def index
    render json: { disciplines: Discipline.all }
  end

  def create
    @discipline = Discipline.new(discipline_params)

    if @discipline.save
      render json: { message: 'Disciplina criada com sucesso!', discipline: @discipline }
    else
      render json: { message: 'Houve uma falha na criação da disciplina.' }
    end
  end

  private

  def discipline_params
    params.permit(:name, :description)
  end
end
