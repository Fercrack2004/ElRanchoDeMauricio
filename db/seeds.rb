# Cuenta de administrador
User.find_or_create_by!(email: "admin@admin.admin") do |user|
  user.username = "admin"
  user.phone_number = "1234567890"
  user.password = "admin@admin.admin"
  user.password_confirmation = "admin@admin.admin"
  user.role = :admin
  user.description = "Cuenta predeterminada de administrador"
end

User.find_or_create_by!(email: "mod@mod.mod") do |user|
  user.username = "mod"
  user.phone_number = "0987654321"
  user.password = "mod@mod.mod"
  user.password_confirmation = "mod@mod.mod"
  user.role = :moderator
  user.description = "Cuenta predeterminada de moderador"
end
