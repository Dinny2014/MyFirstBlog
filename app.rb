require "sinatra/base"
	require "sinatra/activerecord"
	require_relative "models/post"

class App < Sinatra::Base 
		register Sinatra::ActiveRecordExtension
	get "/posts" do 
		@posts = Post.all
		erb :posts 
	end
	get "/posts/:id/edit" do 
		@post = Post.find(params[:id])
		erb :edit

	end
	post "/posts/:id" do 
		@post = Post.find {params[:id]}
		@post.update (params[:post]) 
		redirect to("/posts/#{params[:id]}/edit")

	end
	get "/posts/new"do
	erb :new
	end
	post "/posts" do 
	@post = Post.create(title: params[:title], content: params[:content], status: params[:status])
	redirect to ("/posts/#{@post.id}/edit")
	end

	get "/" do 
@posts =Post.where(status: "published") 

		erb :index 


	end 

	get "/:id" do
		@post = Post.where(status: 'published', id: params[:id]).first
		erb :post 

	end

end 