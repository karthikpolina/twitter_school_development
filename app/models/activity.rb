class Activity < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :school_users
end
