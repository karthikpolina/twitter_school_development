class SchoolUser < ActiveRecord::Base
  belongs_to :role
  belongs_to :school
end
