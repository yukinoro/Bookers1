class BlogsController < ApplicationController

  def index
  	@blogs = Blog.all
  	@blog = Blog.new
  end

  def show
  	@blog = Blog.find(params[:id])
  end
  

  def create
        blog = Blog.new(blog_params)
        blog.save
        redirect_to blogs_path
  end
  def edit
  	@blog = Blog.find(params[:id])
  end
  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    if @blog.update(blog_params)
    redirect_to blog_path, notice: "Book was successfully updated."
  else
    render action: :edit
  end
  end
  def destroy
  	@blog = Blog.find(params[:id])
  	@blog.destroy
  	redirect_to blogs_path, notice: "Book was successfully destroyed."
  end
	 
private
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
