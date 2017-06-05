class TeasController < Sinatra::Base

	# sets root as the parent-directory of the current file	
  set :root, File.join(File.dirname(__FILE__), '..')

 	# sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

	configure :development do
  	register Sinatra::Reloader
	end

	#index
	get '/' do
		@title = "Tea life"

    erb :"teas/index"
	end

	get '/new' do
		erb :"teas/new"
	end

	get '/:id' do
		id = params[:id].to_i
		"SHOW: #{id}"
  end

	post '/' do
		"posted"
	end

	put '/:id' do
	end

	delete '/:id' do
		id = params[:id].to_i
		"delete"
	end

	get '/:id/edit' do
		id = params[:id].to_i
		"edit: #{id}"
	end


end
