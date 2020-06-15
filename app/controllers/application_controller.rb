
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

# index action

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # new action
  get '/articles/new' do
    erb :new
  end

  #create action

  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
    erb :new
  end

  # show action
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  # edit action
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end

  # update action
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    @article.save
    redirect "/articles/#{@article.id}"
  end

  # delete action
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
