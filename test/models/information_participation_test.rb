require "test_helper"

class InformationParticipationTest < ActiveSupport::TestCase
  def setup 
    @user = users(:one)
    @information = information(:one) ### CAMBIAR POR EL PLURAL DE INFORMATION
  end 

  test "no es válido sin contruibidor" do
  participation = InformationParticipation.new(
    user: @user,
    information: @information,
    contribution: nil
  )
  assert_not participation.valid?
  assert_includes participation.errors[:contribution], "can't be blank"
end

  
  test "no es válido sin información" do
    participation = InformationParticipation.new(
      user: @user,
      information: nil,
      contribution: "autor"
    )
    assert_not participation.valid?
    assert_includes participation.errors[:information], "must exist"
  end   

  
  test "no es válido sin usuario" do
    participation = InformationParticipation.new(
      user: nil,
      information: @information,
      contribution: "editor"
    )
    assert_not participation.valid?
    assert_includes participation.errors[:user], "must exist"
  end



end
