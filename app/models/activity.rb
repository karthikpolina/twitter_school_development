class Activity < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :school_users

  has_attached_file :image, :styles => {:small => "150x150>"},
  					:url  => "/assets/products/:id/:style/:basename.:extension",
                  	:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"


  #validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']


  def image_url
        image.url(:small)
    end


end
