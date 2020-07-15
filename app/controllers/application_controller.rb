class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  # code actions here!

  get '/' do
  redirect to '/recipes'
  end

  #create - get form
  get '/recipes/new' do
    erb :new
  end

  #read - show
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #read - index
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  
  #create instance - rediriect to showpage
  post '/recipes' do
    #binding.pry
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #update - get form
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  #update - patch DB and redirect to show page
  patch '/recipes/:id' do
    #binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
  redirect to "/recipes/#{@recipe.id}"
  end

  #delete - and redirects to index page
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect to "/recipes"
  end

end
