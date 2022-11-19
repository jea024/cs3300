module ControllerMacros
  def login_user
    before(:each) do
      #@request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      login_as(user)
    end
  end
end