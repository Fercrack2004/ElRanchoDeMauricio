# Cuenta de administrador
User.find_or_create_by!(email: "admin@admin.admin") do |user|
  user.username = "admin"
  user.phone_number = "1234567890"
  user.password = "admin@admin.admin"
  user.password_confirmation = "admin@admin.admin"
  user.role = :admin
  user.description = "Cuenta predeterminada de administrador"
end
