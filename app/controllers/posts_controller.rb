class PostsController < ApplicationController
	def index
		
	end

	def blogs
		@posts = Post.all.order('created_at DESC')
		@posts = Post.order(:title).page(params[:page]).per(3)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end

	def about
	end

	private 
	def post_params
		params.require(:post).permit(:title, :body)
	end
end
