class SubjectsController < ApplicationController
    def index
        check_status
        @id = User.find(session[:id]).user_type
        @subjects = SpecificSubject.where(user: session[:id])
    end
    def show
        @subject = Subject.find(params[:id])
    end
    def students
        @users = SpecificSubject.where(subject: params[:id])
    end
    def create
        subject = Subject.new(subject_params)
        subject.user = User.find(session[:id])
        if subject.save
            SpecificSubject.create(subject: Subject.find(subject.id),user: User.find(session[:id]))
            redirect_to '/subjects'
        end
    end
    def log_out
        session.clear
        redirect_to '/login'
    end
    private
    def subject_params
        params.require(:subject).permit(:title,:section) 
    end
    def check_status
        if !session[:id]
            redirect_to '/login'
        end
    end
end
