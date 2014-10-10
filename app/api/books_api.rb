class Books_API < Grape::API
  
  before do
    header "Access-Control-Allow-Origin", "*"
    header "Access-Control-Allow-Methods","GET,POST,OPTIONS"
    header "Access-Control-Allow-Headers","*"
  end

 #obj = Books.create(:title => 'aaaaaa')
  desc "hello"
  get :hello do
    {text:'hello'}
  end

  resource "tests" do
    desc "tests"
    get do
      {text:'tests'}
    end
 
    post do
      Books.create(:title => params[:title])
    end
  end

  resource "save_feed" do
    desc "insert a feed"
    params do
      requires :user_id,   type:Integer, desc: "User ID"
      requires :user_name, type:String,  desc: "User Name"
      requires :icon_url,  type:String,  desc: "ICON URL"
      requires :comment,   type:String,  desc: "Comment"
    end
    get do
      Feeds.create(
        :user_id=>params[:user_id],
        :user_name=>params[:user_name],
        :icon_url=>params[:icon_url],
        :comment=>params[:comment]
      )
    end
  end

  resource "feeds" do
    desc "get all feeds"
#header 'Access-Control-Allow-Origin', '*'
    get do
      #Feeds.all
      Feeds.limit(999).order("id DESC")
    end
    desc "get a feed"
    params do
      requires:id,type:Integer
    end
    get ':id' do
      Feeds.find(params[:id])
    end
    
    desc "insert a feed"
    params do
      requires :user_id,   type:Integer, desc: "User ID"
      requires :user_name, type:String,  desc: "User Name"
      requires :icon_url,  type:String,  desc: "ICON URL"
      requires :comment,   type:String,  desc: "Comment"
    end
    post do
      Feeds.create(
        :user_id=>params[:user_id],
        :user_name=>params[:user_name],
        :icon_url=>params[:icon_url],
        :comment=>params[:comment]
      )
    end
  end

  resource "books" do
    desc "returns all books"
    get do
      Books.all
    end
    desc "return a books"
    params do
      requires :id, type: Integer
      optional :title, type: String
    end
    get ':id' do
      Books.find(params[:id])
    end
  end
end

