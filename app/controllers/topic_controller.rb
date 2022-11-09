class TopicController < ApplicationController
    def index
        check_status
        @subject = Subject.find(params[:subject_id])
        @post = Post.find(params[:id])
        @user = User.find(session[:id])
        @postComments = Postcomment.where(post:params[:id]).order(created_at: :desc)
        # puts "\n\n\n\n\n\n\n #{@postComments.first.inspect}\n\n\n\n\n\n"
        @replies = Comment.where(imageable_type: 'Postcomment').order('created_at DESC')
    end
    def create
        post = Post.new(post_param)
        post.user_id = session[:id]
        post.subject_id = params[:id]
        allPosts = AllPost.new
        allPosts.user_id = session[:id]
        allPosts.subject_id = params[:id]
        allPosts.imageable = post
        if post.save && allPosts.save
            puts 'success'
        else
            puts allPosts.errors.full_messages
            puts post.errors.full_messages
            puts 'error'
        end
        redirect_to "/subjects/#{params[:id]}"
    end
    def show
        @user = User.find(session[:id])
        @specific_subs = SpecificSubject.where(user_id: @user).order('created_at DESC')
    end
    def delete
        spec_comment = Comment.where(imageable: Postcomment.find_by(post_id: params[:id])).destroy_all
        all_post = AllPost.find_by(imageable: Post.find(params[:id])).delete
        post = Post.find(params[:id]).destroy
        redirect_to "/subjects/#{params[:subject_id]}"
    end
    def update
        post = Post.find(params[:id]).update(post_param)
        redirect_to "/subjects/#{params[:subject_id]}/post/#{params[:id]}"
    end
    private
    def post_param
        params.require(:topic).permit(:title,:due_date,:content)
    end
    def check_status
        if !session[:id]
            redirect_to '/login'
        end
    end
end
