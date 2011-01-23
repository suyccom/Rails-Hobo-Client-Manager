class Email < ActiveRecord::Base

  hobo_model # Don't put anything above this

  # --- Campos --- #
  fields do
    titulo    :string
    contenido :text
    timestamps
  end
  
  # --- Relaciones --- #
  belongs_to :emisor, :class_name => 'User'
  belongs_to :receptor, :class_name => 'User'
  
  
  # --- Atributos virtuales --- #
  def name
    titulo
  end
  
  def enviado
    if (emisor.id == 1)
      return true
    else
      return ""
    end
  end
  
  set_search_columns :titulo
  
  # --- Custom scopes --- #
#  named_scope :contacto_is, 
#           :conditions=>"emisor_id = 'TECHNOLOGY'"
  named_scope :contacto_is, lambda { |id|
    
      { :conditions => "emisor_id = '" + id.to_s + "' OR receptor_id = '" + id.to_s + "'" }
    
  }

  

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
