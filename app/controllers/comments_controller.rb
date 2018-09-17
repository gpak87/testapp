class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    #@comments = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @comment = Comment.new
  end

  # GET /posts/1/edit

  # POST /posts
  # POST /posts.json
  def create
    @comment = Comment.new(comment_params)
    # if @comment.valid?
    #   @comment.save
    # else
    #   @comment.errors
    # end
    #
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :nick, :post_id)
    end
end
