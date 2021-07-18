class Discipline::DependenciesController < ApplicationController
  def create
    @dependency = Dependency.new(discipline: Discipline.find_by(id: params[:discipline_id]),
                                 dependency_id: Discipline.find_by(id: params[:dependency_id]).id)

    if !@dependency.valid
      render json: { message: 'Dependência cíclica ou redundante' }, status: 417

    elsif @dependency.save
      render json: { message: 'Dependência registrada com sucesso!', dependency: @dependency }

    else
      render json: { message: 'falha ao adicionar dependência' }, status: 417
    end
  end

  def delete
    return unless Dependency.find_by(id: params[:dependency_id]).destroy

    render json: { message: 'Dependência removida com sucesso!' }
  end

  def show_by_discipline
    render json: Discipline.find_by(id: params[:discipline_id]).dependencies
  end
end
