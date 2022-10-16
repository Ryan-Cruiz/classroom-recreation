class StudentsController < ApplicationController
    def index
        check_status
        @subject_id = params[:id]
        @count = 0
        @users = SpecificSubject.where(subject: params[:id])
        if !@search_query
            @search_query = User.where('first_name || last_name LIKE ?', "%%")
            @specific = Subject.find(params[:id]).specific_subjects
        end
    end
    def search
        @subject_id = params[:id]
        @search_query = User.where('first_name || last_name LIKE ?', "%#{params[:student][:name]}%")
        render :partial => 'shared/list', :formats => [:html], locals: {search_query: @search_query,subject_id: @subject_id}
    end
    def create
        # fail
        specific = SpecificSubject.new(subject: Subject.find(params[:subject_id]),user: User.find(params[:id]))
        user = SpecificSubject.where(subject: params[:subject_id],user: params[:id])
        if user.length <= 0 
            specific.save
        end
        redirect_to "/subjects/#{params[:subject_id]}/students"
    end
    def delete
        SpecificSubject.find_by(subject: Subject.find(params[:subject_id]),user: User.find(params[:id])).destroy
        redirect_to "/subjects/#{params[:subject_id]}/students"
    end
    private
    def check_status
        if !session[:id]
            redirect_to '/login'
        end
    end
end
