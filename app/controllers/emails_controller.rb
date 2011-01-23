class EmailsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => [:new,:create,:edit]
  #auto_actions :all
  
  # --- Index --- #
  def index
    hobo_index Email.apply_scopes(
      :contacto_is => session[:cliente],
      :order_by => 'id')
  end

end
