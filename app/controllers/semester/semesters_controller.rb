class Semester::SemestersController < ApplicationController
  def create
    @semester = Semester.new(name: params[:name])

    if @semester.save
      render json: { message: 'Semestre criado com sucesso!',
                     semester: @semester }
    else
      renser json: { message: 'Falha ao adicionar semestre',
                     semester: @semester }
      end
  end
end
