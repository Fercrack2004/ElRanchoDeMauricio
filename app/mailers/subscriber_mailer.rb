class SubscriberMailer < ApplicationMailer
  default from: 'elranchodemauricio1@gmail.com'

  def welcome_email
    @subscriber = params[:subscriber]
    mail(to: @subscriber.email, subject: '¡Bienvenido a ElRanchoDeMauricio!')
  end
end