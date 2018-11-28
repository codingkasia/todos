class TodosController < ApplicationController
    before_action :authenticate
    
    def index
        @todos = Todo.where(email: current_email)
    end

    def new
        @todo = Todo.new
    end

    def create
        Todo.create(todo_params.merge(email: current_email))
        redirect_to todos_path
    end

    private

    def current_email
        session[:current_email]
    end


    def authenticate
        if !signed_in?
            redirect_to new_session_path
        end
    end

    def signed_in?
        session[:current_email].present?
    end

    def todo_params 
        params.require(:todo).permit(:title)
    end
end