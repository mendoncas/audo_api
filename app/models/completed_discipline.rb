class CompletedDiscipline < ApplicationRecord
  belongs_to :student
  belongs_to :discipline
end
