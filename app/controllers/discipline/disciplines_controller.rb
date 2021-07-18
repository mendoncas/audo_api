class Discipline::DisciplinesController < ApplicationController
  def index
    render json: { disciplines: Discipline.all }
  end

  def create
    @discipline = Discipline.new(discipline_params)
    @discipline.semester = Semester.find_by(id: params[:semester_id])

    if @discipline.save
      render json: { message: 'Disciplina criada com sucesso!', discipline: @discipline }
    else
      render json: { message: 'Houve uma falha na criação da disciplina.' }
    end
  end

  def graph
    redirect_to gen_link
  end

  private

  def gen_link # gera um liink para API graphviz
    @dot = ''

    Semester.all.each do |semester| # gera um código dot para as disciplinas
      @dot += semester.generate_dot # dupla iteração. buscar maneira mais eficiente
    end

    "https://quickchart.io/graphviz?graph=digraph{#{@dot}}"
  end

  def discipline_params
    params.permit(:name, :description)
  end
end
