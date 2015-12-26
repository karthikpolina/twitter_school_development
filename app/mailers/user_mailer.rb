class UserMailer < ApplicationMailer
default :from => "karthikp2323@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail :to =>  user.email_id, :subject => "Registered"
  end

end
