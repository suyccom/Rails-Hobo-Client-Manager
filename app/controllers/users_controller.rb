class UsersController < ApplicationController

  hobo_user_controller

  auto_actions :all, :except => [ :signup ] 
  
  
  # --- Index --- #
  def index
    #Variable con la página actual, se usa en el menú principal
    @actual = '/users'
    #En la lista de clientes/usuarios no tienen que salir los administradores
    hobo_index User.apply_scopes(:administrator_is => 'f')
  end
  
  
  # --- Show --- #
  def show

  
    @cliente = User.find(params[:id])

    @emails = @cliente.emails_enviados
    
    #Variable con la página actual, se usa en el menú principal
    @actual = '/users/' + @cliente.id.to_s  
    
    #Cuando se carga un cliente, establecer variable de sesión
    session[:cliente] = @cliente.id
    session[:nombre_cliente] = @cliente.name
    
    hobo_show
  end

end
