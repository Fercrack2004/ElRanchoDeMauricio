require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "no permite contraseña con menos de 6 caracteres" do
    user = User.new(
      username: "ejemplo",
      email: "ejemplo@test.com",
      phone_number: "123456789",
      role: "user",
      password: "12345",  # 5 caracteres
      password_confirmation: "12345"
    )

    assert_not user.valid?
    assert_includes user.errors[:password], "is too short (minimum is 6 characters)"
  end
  test "no permite sin contraseña" do
    user = User.new(
      username: "ejemplo",
      email: "ejemplo@test.com",
      phone_number: "123456789",
      role: "user",
      password: nil,
      password_confirmation: "12345"
    )
    assert_not user.valid?
    assert_includes user.errors[:password], "is too short (minimum is 6 characters)"
  end

  test "permite contraseña con 6 caracteres o más" do
    user = User.new(
      username: "ejemplo",
      email: "ejemplo@test.com",
      phone_number: "123456789",
      role: "user",
      password: "123456",  # 6 caracteres
      password_confirmation: "123456"
    )
    assert user.valid?
  end
  test "no permite crear usuario sin número de teléfono" do
    user = User.new(
      username: "sinphone",
      email: "ejemplo@correo.com", 
      password: "123456", 
      phone_number: nil, 
      role: "user",
      password: "123456", 
      password_confirmation: "123456")
    assert_not user.valid?, "El usuario debería ser inválido sin número de teléfono"
    assert_includes user.errors[:phone_number], "can't be blank"
  end

  test "permite crear usuario con número de teléfono" do
    user = User.new(
      username: "conphone",
      email: "ejemplo@correo.com", 
      password: "123456", 
      phone_number: "123456789",
      role: "user",
      password: "123456",
      password_confirmation: "123456")
    assert user.valid?, "El usuario debería ser válido con número de teléfono"
  end

  test "no permite crear usuario sin email" do
    user = User.new(
      username: "conphone",
      email: nil, 
      password: "123456", 
      phone_number: "123456789",
      role: "user",
      password: "123456",
      password_confirmation: "123456")
    assert_not user.valid?, "El usuario debería ser inválido sin email"
    assert_includes user.errors[:email], "can't be blank"
  end

  test "no permite crear usuario con formato incorrecto de email" do
    user = User.new(
      username: "conphone",
      email: "holaestoestamal", 
      password: "123456", 
      phone_number: "123456789",
      role: "user",
      password: "123456",
      password_confirmation: "123456")
    assert_not user.valid?, "El usuario debería ser inválido sin email"
    assert_includes user.errors[:email], "is invalid"
  end

  test "no permite usuario sin role" do
    user = User.new(
      username: "ejemplo",
      email: "ejemplo@test.com",
      phone_number: "123456789",
      role: nil,
      password: "123456",  # 6 caracteres
      password_confirmation: "123456"
    )
    assert_not user.valid?
    assert_includes user.errors[:role], "can't be blank"

  end

  
  test "no permite usuario con role invalido" do
    assert_raises ArgumentError do 
      User.new(
      username: "ejemplo",
      email: "ejemplo@test.com",
      phone_number: "123456789",
      role: "dios de la pagina",
      password: "123456",  # 6 caracteres
      password_confirmation: "123456"
    )
    end

  end

end

