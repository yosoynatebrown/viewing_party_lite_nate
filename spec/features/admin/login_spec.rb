require "rails_helper"

describe "Admin login" do
  describe "happy path" do
    it "I can log in as an admin and get to my dashboard" do
	    admin = User.create({email: "superuser@awesome-site.com",
                        password: "super_secret_passw0rd",
                        role: 1})

      visit login_path
      fill_in :email, with: admin.email
      fill_in :password, with: admin.password
      click_button 'Log In'

      expect(current_path).to eq(admin_dashboard_path)
    end
  end

    describe "as default user" do
    it 'does not allow default user to see admin dashboard index' do
      user = User.create({email: "fern@gully.com",
                         password: "password",
                         role: 0})

      visit "/admin/dashboard"

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end