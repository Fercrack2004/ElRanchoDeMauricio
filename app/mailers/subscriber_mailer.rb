class SubscriberMailer < ApplicationMailer
  default from: 'noreply@elranchodemauricio.com'

  def welcome_email
    @subscriber = params[:subscriber]
    mail(to: @subscriber.email, subject: '¡Bienvenido a ElRanchoDeMauricio!')
  end
end