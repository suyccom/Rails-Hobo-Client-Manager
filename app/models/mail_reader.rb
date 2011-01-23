class MailReader < ActionMailer::Base
  
  def receive(msg)
    email = Email.new :titulo => msg.subject, :contenido => msg.body
    email.save
  end

end
