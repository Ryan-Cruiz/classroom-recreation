class SubjectsController < ApplicationController
    def index
        if !session[:id]
            redirect_to '/login'
        else
            @subjects = SpecificSubject.where(user: session[:id])
            @user = User.find(session[:id]).user_type
        end
    end
    def show
        check_status
        @posts = Post.where(subject: params[:id]).order("created_at DESC")
        @subject = Subject.find(params[:id])
        @user = User.find(session[:id])
        # @comments = Comment.where(imageable: Subject.find(params[:id])).where.not(imageable_type: "Postcomment").order('created_at DESC')
        @comments = AllPost.where(subject: Subject.find(params[:id])).order('created_at DESC')
    end
    def search
        @user = User.find(session[:id]).user_type
        @subjects = SpecificSubject.joins(:user).left_joins(:subject).where("users.id = ? AND subjects.title LIKE ?", session[:id],"%#{params[:subject][:title]}%")
        render partial: 'shared/subjects', locals: {subjects: @subjects,user: @user}
        # puts "\n\n\n\n\n\n#{@subjects.inspect}\n\n\n\n\n\n"
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
