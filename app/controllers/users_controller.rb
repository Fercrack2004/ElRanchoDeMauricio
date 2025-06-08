class UsersController < ApplicationController
  # 1. Asegura que el usuario esté logueado para todas las acciones.
  before_action :authenticate_user!

  # 2. Solo los admins pueden acceder a la lista, actualizar roles o eliminar.
  #    La página de perfil (show) es pública para cualquier usuario logueado.
  before_action :require_admin, only: [:index, :update_role, :destroy]

  # Muestra la lista de todos los usuarios en el Panel de Administración.
  def index
    @users = User.all.order(:email)
  end

  # Muestra el perfil público de un solo usuario.
  def show
    @user = User.find(params[:id])
  end

  # Actualiza el rol de un usuario desde el Panel de Administración.
  def update_role
    @user = User.find(params[:id])
    if @user.update(role: params[:user][:role])
      redirect_to users_path, notice: "El rol de #{@user.email} ha sido actualizado a '#{@user.role.humanize}'."
    else
      # Si falla, muestra los errores.
      redirect_to users_path, alert: "No se pudo actualizar el rol: #{@user.errors.full_messages.to_sentence}"
    end
  end

  # Elimina a un usuario.
  def destroy
    @user = User.find(params[:id])
    # Por seguridad, no permitimos que un admin se elimine a sí mismo.
    if @user == current_user
      redirect_to users_path, alert: "No puedes eliminar tu propia cuenta de administrador."
    else
      @user.destroy
      redirect_to users_path, notice: "El usuario #{@user.email} ha sido eliminado."
    end
  end

  private

  # Método de seguridad que se ejecuta antes de las acciones protegidas.
  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: "No tienes permiso para acceder a esta sección."
    end
  end
end
