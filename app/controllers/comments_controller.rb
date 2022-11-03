class CommentsController < ApplicationController
    def announce_comment
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
    def post_comment
        comment_post = Postcomment.new(comment_param)
        comment_post.user_id = session[:id]
        comment_post.post_id = params[:post_id]
        if comment_post.save
            puts "\n\n\n\n\nsuccess\n\n\n\n\n\n"
        else
            puts comment_post.errors.full_messages
            puts "\n\n\n\n\nerror\n\n\n\n\n\n"
        end
        redirect_to "/subjects/#{params[:subject_id]}/post/#{params[:post_id]}"
    end
    def reply_comment
        comment_reply = Comment.new(comment_param)
        comment_reply.user_id = session[:id]
        comment_reply.imageable = Postcomment.find(params[:id])
        if comment_reply.save
            puts "\n\n\n\n\nsuccess\n\n\n\n\n\n"
        else
            puts comment_reply.errors.full_messages
            puts "\n\n\n\n\n error\n\n\n\n\n\n"
        end
        redirect_to "/subjects/#{params[:subject_id]}/post/#{params[:post_id]}"
    end
    private 
    def comment_param
        params.require(:comment).permit(:content)
    end
end
