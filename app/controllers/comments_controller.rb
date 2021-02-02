class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  #skip_before_action :verify_authenticity_token

  # GET /comments
  def index
    if params[:post_id]
      @post = Post.find(params[:post_id])
      @comments = @post.comments
    else
      @comments = Comment.all
    end
    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
    #binding.pry
    #@comment = Comment.new(comment_params)
    #if @comment.save
     # render json: @comment, status: :created, location: @comment
    #else
     # render json: @comment.errors, status: :unprocessable_entity
    #end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
    #@comment = Comment.find(params["id"])
    #@post = Post.find(@comment.post_id)
    #@comment.destroy
    #render json: @post
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:name, :content, :post_id)
    end
end
