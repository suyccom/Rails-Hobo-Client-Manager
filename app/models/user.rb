class User < ActiveRecord::Base

  hobo_user_model # Don't put anything above this

  fields do
    name          :string, :required, :unique
    email_address :email_address, :login => true
    administrator :boolean, :default => false
    telefono :string
    fax      :string
    notas    :text
    fecha_alta :date
    fecha_baja :date
    timestamps
  end
  
  has_many :documentos
  has_many :emails_enviados, :class_name => 'Email', :foreign_key => 'emisor_id'
  has_many :emails_recibidos, :class_name => 'Email', :foreign_key => 'receptor_id'
  
  
  
  def numero_total_emails
    emails_enviados.count + emails_recibidos.count
  end
  
  
  # --- Paperclip --- #
  has_attached_file :logo, 
    :styles => { 
      :medium => ["500x800", :jpg ], 
      :small => ["140x140#", :jpg ], 
      :thumbnail => ["70x70#", :jpg ] 
    }, 
    :default_style => :original, 
    :path => "#{RAILS_ROOT}/public/images/fotos/:style/:id_:basename.:extension",
    :url => "images/fotos/:style/:id_:basename.:extension",
    :default_url => 'images/gravatar-140.png'

  # This gives admin rights to the first sign-up.
  # Just remove it if you don't want that
  before_create { |user| user.administrator = true if !Rails.env.test? && count == 0 }

  
  # --- Signup lifecycle --- #

  lifecycle :state_field => :estado do

    state :active, :default => true
    state :inactive

    create :signup, :available_to => "Guest",
           :params => [:name, :email_address, :password, :password_confirmation],
           :become => :active do
      self.fecha_alta = Date.today
      self.save
    end
           
    
    transition :dar_de_baja, { :active => :inactive }, :available_to => "User.find(:all, :conditions => \"administrator = 't'\")" do
      self.fecha_baja = Date.today
      self.save
    end
    transition :dar_de_alta, { :inactive => :active }, :available_to => "User.find(:all, :conditions => \"administrator = 't'\")" do
      self.fecha_alta = Date.today
      self.save
    end
      
             
    transition :request_password_reset, { :active => :active }, :new_key => true do
      UserMailer.deliver_forgot_password(self, lifecycle.key)
    end

    transition :reset_password, { :active => :active }, :available_to => :key_holder,
               :params => [ :password, :password_confirmation ]

  end
  

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator? || 
      (acting_user == self && only_changed?(:email_address, :crypted_password,
                                            :current_password, :password, :password_confirmation))
    # Note: crypted_password has attr_protected so although it is permitted to change, it cannot be changed
    # directly from a form submission.
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
