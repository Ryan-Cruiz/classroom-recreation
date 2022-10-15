class TopicController < ApplicationController
    def index
        check_status
        @subject = Subject.find(params[:subject_id])
        @post = Post.find(params[:id])
        @user = User.find(session[:id])
    end

    def create
        post = Post.new(post_param)
        post.user_id = session[:id]
        post.subject_id = params[:id]
        if post.save
            puts 'success'
        else
            puts post.errors.full_messages
            puts 'error'
        end
        redirect_to "/subjects/#{params[:id]}"
    end

    def comment
        comment = Comment.new(comment_param)
        comment.user_id = session[:id]
        comment.imageable = Subject.find(params[:id])
        if comment.save
            puts 'success'
        else
            puts comment.errors.full_messages
            puts 'error'
        end
        redirect_to "/subjects/#{params[:id]}"
    end

    def delete
        
    end
    def update

    end
    private
    def post_param
        params.require(:topic).permit(:title,:due_date,:content)
    end
    def comment_param
        params.require(:comment).permit(:content)
    end
    def check_status
        if !session[:id]
            redirect_to '/login'
        end
    end
end
