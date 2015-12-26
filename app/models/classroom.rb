class Classroom < ActiveRecord::Base
  belongs_to :school
  belongs_to :school_user
end
