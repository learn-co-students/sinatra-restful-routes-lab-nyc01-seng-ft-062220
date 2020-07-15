class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  #READ
  get "/" do

    erb :index
  end

  get "/recipes" do
    @recipes = Recipe.all

    erb :index
  end

  #CREATE
  get "/recipes/new" do

     erb :new
  end

  post "/recipes" do
    @recipe = Recipe.create(params)

     redirect to "/recipes/#{@recipe.id}"
  end

  #SHOW
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

  #UPDATE
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])

      erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])

    @recipe.update(params[:recipe])

    redirect to "/recipes/#{@recipe.id}"
  end

  #DELETE
  delete "/recipes/:id" do
    @recipe = Recipe.find(params[:id])

    @recipe.destroy

    redirect to "/recipes"
  end

end
