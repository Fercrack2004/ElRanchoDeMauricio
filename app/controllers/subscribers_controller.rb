class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      # Si se guarda con éxito, muestra un mensaje de agradecimiento.
      flash[:notice] = "¡Gracias por suscribirte! Recibirás nuestras mejores recetas."
      SubscriberMailer.with(subscriber: @subscriber).welcome_email.deliver_later
    else
      # Si falla (ej. correo inválido o duplicado), muestra un mensaje de error.
      flash[:alert] = "No se pudo procesar tu suscripción: #{@subscriber.errors.full_messages.to_sentence}"
    end
    
    # Redirige al usuario de vuelta a la página de inicio.
    redirect_to root_path
  end

  private

  # Strong Parameters: solo permite que el campo :email sea enviado desde el formulario.
  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end