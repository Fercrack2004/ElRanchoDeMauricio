# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # IMPORTANTE: Eliminamos cualquier skip_before_action que interfiera
  before_action :prevent_authenticated_access, only: [:new, :create]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  
  # Configuraciones personalizadas
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /register
  def new
    if user_signed_in?
      redirect_to root_path, 
                  alert: "Ya tienes una sesión activa. Cierra sesión para registrar una nueva cuenta."
      return
    end
    build_resource({})
    respond_with resource
  end

  # POST /register
  def create
    if user_signed_in?
      redirect_to root_path,
                  alert: "No puedes registrarte mientras tengas sesión activa."
      return
    end
    
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # DELETE /resource
  def destroy
    ActiveRecord::Base.transaction do
      resource.blog_participations.destroy_all
      resource.reviews.destroy_all
      resource.messages.destroy_all
      resource.requests.destroy_all
      resource.information_participations.destroy_all
      resource.destroy!
      
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      set_flash_message! :notice, :destroyed
      yield resource if block_given?
      respond_with_navigational(resource) { redirect_to after_sign_out_path_for(resource_name) }
    end
  rescue ActiveRecord::RecordNotDestroyed => e
    set_flash_message! :alert, "No se pudo eliminar todas las dependencias: #{e.record.errors.full_messages.join(', ')}"
    redirect_back fallback_location: edit_user_registration_path
  rescue => e
    set_flash_message! :alert, "Error al eliminar la cuenta: #{e.message}"
    redirect_back fallback_location: edit_user_registration_path
  end

  protected

  # Bloquea acceso a registro si ya está autenticado
  def prevent_authenticated_access
    if user_signed_in?
      redirect_to root_path,
                  alert: "Ya tienes una sesión activa. Cierra sesión antes de registrar una nueva cuenta."
    end
  end

  # Parámetros permitidos para registro
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone_number])
  end

  # Parámetros permitidos para actualización
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, 
      keys: [:username, :phone_number, :description])
  end

  # Lógica especial para actualización sin contraseña
  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      # Actualización sin cambiar contraseña
      params.delete(:password)
      params.delete(:password_confirmation)
      
      if resource.valid_password?(params[:current_password])
        resource.update_without_password(params.except(:current_password))
      else
        resource.errors.add(:current_password, params[:current_password].blank? ? :blank : :invalid)
        false
      end
    else
      # Comportamiento normal para cambio de contraseña
      super
    end
  end

  # Manejo de dependencias al eliminar usuario
  def destroy_resource(resource)
    ActiveRecord::Base.transaction do
      # Elimina todas las dependencias manualmente si es necesario
      resource.blog_participations.destroy_all if resource.respond_to?(:blog_participations)
      resource.destroy!
    end
    true
  rescue ActiveRecord::RecordNotDestroyed => e
    logger.error "Error al eliminar usuario: #{e.message}"
    false
  rescue ActiveRecord::InvalidForeignKey => e
    logger.error "Error de integridad referencial: #{e.message}"
    false
  end

  # Redirección después de registro exitoso
  def after_sign_up_path_for(resource)
    root_path # Cambia esto según tus necesidades
  end

  # Redirección después de actualizar perfil
  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end

  # Redirección después de cancelar cuenta
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end