require 'rails_helper'

feature "User sees own todos" do
    scenario "doesn't see others' todos" do
        Todo.create!(title: "buy apples", email: "foo@example.com")
        sign_in_as "foo@example.com"
    end
end
