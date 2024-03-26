class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum role: [:visitante, :despachador, :almacenista, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
      self.role ||= :visitante
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at", "username"]
  end
  
end
