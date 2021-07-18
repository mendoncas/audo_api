class Semester < ApplicationRecord
  has_many :disciplines

  def generate_dot
    @deps = ''

    disciplines.each do |disc|
      @deps += disc.generate_dot
    end

    "subgraph cluster#{id}{ node [style=filled];#{disciplines.all.pluck(:name).join(' ')};label = #{id}};" + @deps
  end
end
