class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts.as_json(include:{comments:{only:[:id, :name, :content, :post_id]}})
  end

  # GET /posts/1
  def show
    render json: @post.as_json(include:{comments:{only:[:id, :name, :content, :post_id]}})
  end

  # POST /posts
  def create
    #binding.pry
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :author, :mood, :content, :likes, :date, comment_attributes: [:id, :name, :content, :post_id])
    end
end
