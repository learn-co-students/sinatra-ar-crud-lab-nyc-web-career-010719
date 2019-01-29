
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end
  #
  post '/articles' do
    # binding.pry
    @article = Article.create(params)
    # @article.title = params[:article][":title"]
    # @article.content = params[:article][":content"

    redirect to "/articles/#{@article.id}"
  end

  get "/articles/:id" do
    # binding.pry
    @article = Article.find(params[:id])
    # binding.pry
    erb :show
  end

  # edit
 get "/articles/:id/edit" do
   @article = Article.find(params[:id])
   erb :edit
 end

 # update
 patch "/articles/:id" do
   @article = Article.find(params[:id])
   @article.update(params[:article])
   redirect to "/articles/#{ @article.id }"
 end

 #destroy
 delete "/articles/:id" do
   Article.destroy(params[:id])
   redirect to "/articles"
 end

end
