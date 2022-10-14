class TopicController < ApplicationController
    def show
        @id = User.find(session[:id]).user_type
    end
    def new
    end
end
