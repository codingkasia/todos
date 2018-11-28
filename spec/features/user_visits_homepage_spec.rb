require 'rails_helper'

#capybara - desxribe browser interaction
feature "User visits homepage" do 
    #feature describes functionality added
    scenario "successfully" do 
        visit root_path
        expect(page).to have_css 'h1', text: 'Todos'
    end
end
   