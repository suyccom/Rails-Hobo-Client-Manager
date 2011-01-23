class DocumentosController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => [:new, :edit]
  
  auto_actions_for :user, :create
  
  
  # --- Index --- #
  def index
    #logger.info('patata - el cliente guardado en sesión es: ' + session[:cliente])
    hobo_index Documento.apply_scopes(:user_is => session[:cliente])
  end

end
