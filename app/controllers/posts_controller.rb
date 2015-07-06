class PostsController < ApplicationController

  def index
    @posts = Post.all.order('votes desc')
  end

  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to authenticate_user!
    end
  end

  def create
    @post = Post.new params.require(:post).permit(:title, :link, :user_id)
    @post.user_id = current_user.id
    if @post.save
      redirect_to :root, notice: "Post Added!"
    else
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
    redirect_to @post.link
  end

  def edit
    @post = Post.find params[:id]
    if current_user.nil?
      redirect_to authenticate_user!
    elsif current_user.id == @post.user.id
      render :edit
    else
      redirect_to :root
    end
  end

  def update
    @post = Post.find params[:id]
    if @post.update params.require(:post).permit(:title, :link, :user_id)
      redirect_to :root, notice: "Post Updated!"
    else
      render :edit
    end
  end

  def delete
    @post = Post.find params[:id]
    @post.destroy
    redirect_to :root, notice: "Post Deleted"
  end

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end

  def upvote
    @post = Post.find params[:id]
    @post.votes += 1
    @post.save
    redirect_to :root
  end

  def downvote
    @post = Post.find params[:id]
    @post.votes -= 1
    @post.save
    redirect_to :root
  end

end
