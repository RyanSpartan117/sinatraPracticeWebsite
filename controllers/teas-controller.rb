class TeasController < Sinatra::Base


	configure :development do
  		register Sinatra::Reloader
	end

	# sets root as the parent-directory of the current file	
	set :root, File.join(File.dirname(__FILE__), '..')

 	# sets the view directory correctly
	set :views, Proc.new { File.join(root, "views") } 
	set :public_folder, Proc.new { File.join(root, "public") }

	$teas = [{
		id: 0,
		title: "English Breakfast",
		body: "You have chosen well"
	},
	{
		id: 1,
		title: "Herbal",
		body: "Spiritual!"

	},
	{
		id: 2,
		title: "Earl Grey",
		body: "Wrong"
	},

	{
		id: 3,
		title: "Green Tea",
		body: "NICE"

	}]

	#index
	get '/' do
		@title = "Tea life"
		# id = teas[id]
		@teas = $teas

    	erb :"teas/index"

	end

	get '/new' do

		@teas = $teas
		erb :"teas/new"
	end

	get '/teas/:id' do
		id = params[:id].to_i
		@teas = $teas
		"show: #{@teas[id]}"
	
		@tea = $teas[id]
		erb :"teas/show"
  	end

	post '/' do
		"posted"
	end

	put '/:id' do

	end

	delete '/:id/delete' do
		@teas = $teas
		id = params[:id].to_i
		"delete"
	end

	get '/:id/edit' do
		@teas = $TeasController
		id = params[:id].to_i
		"edit: #{id}"
		erb :"teas/edit"
	end


end
