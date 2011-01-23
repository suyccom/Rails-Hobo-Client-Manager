class Documento < ActiveRecord::Base

  hobo_model # Don't put anything above this

  # --- Campos --- #
  fields do
    fichero :string
    timestamps
  end
  
  # --- Paperclip --- #
  has_attached_file :adjunto, 
          :styles => { 
            :thumbnail => ["70x70#", :jpg ] 
          }, 
          :default_style => :original, 
          :path => "#{RAILS_ROOT}/public/images/fotos/:style/:id_:basename.:extension",
          :url => "images/fotos/:style/:id_:basename.:extension",
          :whiny => false

          
  
  # --- Relaciones --- #
  belongs_to :user
  
  
  # --- Atributos virtuales --- #
  def name
    adjunto.original_filename
  end
  
  def tamanio
    if (adjunto_file_size / 1024) < 1024
      (adjunto_file_size / 1024).to_s + ' KB'
    else
      (adjunto_file_size / 1048576).to_s + ' MB'
    end
  end
  
  def fecha
    created_at.to_s(:long)
  end
  

  set_search_columns :fichero

  def before_save
    self.fichero = name
  end

  
  # --- Validaciones --- #  
  validates_attachment_presence :adjunto
  #validates_attachment_size :foto, :less_than => 2.megabytes
  #validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png']
  

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
