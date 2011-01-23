# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
#  
#  logger.info ('patata: comienzo IMAP')
#   require 'net/imap'

#  imap = Net::IMAP.new('mail.gandi.net')
#  imap.login('tecnicos@unoycero.com', 'ahZojie1')
#  imap.select('INBOX')
#  imap.search(['ALL']).each do |message_id|
#    msg = imap.fetch(message_id,'RFC822')[0].attr['RFC822']
#    #logger.info ('patata: ' + msg)
##   MailReader.receive(msg)
##    imap.store(message_id, "+FLAGS", [:Deleted])
#  end
#  imap.expunge()
#  logger.info ('patata: fin IMAP')

  
  
  before_filter :login_required  
  
  
end
