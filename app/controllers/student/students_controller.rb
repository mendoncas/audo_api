class Student::StudentsController < ApplicationController
  def index
    render json: { students: Student.all }
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      render json: { message: 'Estudante criado com sucesso!', student: @student }
    else
      render json: { message: 'Houve uma falha na criação do estudante.' }
    end
  end

  def recommendation
    render json: Student.find_by(id: params[:student_id]).completable_disciplines
  end

  private

  def student_params
    params.permit(:name)
  end
end
