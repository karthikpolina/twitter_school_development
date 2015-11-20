class School < ActiveRecord::Base

	has_many :school_user, :dependent => :destroy
	accepts_nested_attributes_for :school_user
end
