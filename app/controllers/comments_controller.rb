class CommentsController < ApplicationController
  before_action :set_post_content, only: [:index, :create, :edit, :update, :destroy]
  before_action :set_content, only: [:index, :create, :edit, :update, :destroy]

  def index
    @post = Post.find(params[:post_id])
    @comment = @post.comments
  end
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @post.save
      redirect_to post_comments_path(@post), notice: "El comentarios ha sido creado"
    end

    def edit
      @post = Post.find(params[:edit, :post_id])
      @comment = Comment.find(params[:id])
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(comment_params[:id])
      @comment.destroy(comment_params)
      redirect_to post_comments_path(@post), notice: "El comentario ha sido eliminado"
    end  

    def update
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
      @comment.update(comment_params)
      redirect_to post_comments_path(@post), notice: "El comentario ha sido creado"
    end

    private 
    def comment_params
      params.require(:comment).permit(:content)
    end
end
