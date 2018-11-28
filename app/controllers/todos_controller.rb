class TodosController < ApplicationController
    before_action :authenticate
    
    def index
        @todos = Todo.all
    end

    def new
        @todo = Todo.new
    end

    def create
        Todo.create(todo_params)
        redirect_to todos_path
    end

    private

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