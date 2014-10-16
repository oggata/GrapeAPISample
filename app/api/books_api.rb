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

  resource "save_user" do
    desc "insert user"
    params do
      requires :name,     type:String, desc:"User Name"
      requires :comment,  type:String, desc:"User Comment"
      requires :icon_url, type:String, desc:"Icon URL"
      requires :identification_id, type:Integer, desc:"IdentificationID"
    end
    get do
      Users.create(
        :name=>params[:name],
        :comment=>params[:comment],
        :icon_url=>params[:icon_url],
        :identification_id=>params[:identification_id]
      )
    end
  end


  resource "test11111" do
    #get do
    #  Users.all
    #end

    params do
      requires:id,type:Integer
    end
    get do
      #Users.all
      Users.where("id = ?",params[:id])
    end
  end


  resource "get_all_users" do
    desc ""
    get do
      Users.all
    end
  end

  resource "get_users_by_identification_id" do
    desc ""
    params do
      requires:identification_id,type:Integer
    end
    get do
      Users.where('identification_id = ?',params[:identification_id])
    end
  end

  resource "count_users_by_identification_id" do
    desc ""
    params do
      requires:identification_id,type:Integer
    end
    get do
      Users.where('identification_id = ?',params[:identification_id]).count
    end
  end

  resource "insert_user" do
    desc ""
    params do
      requires :name,     type:String, desc: ""
      requires :comment,  type:String, desc: ""
      requires :icon_url, type:String, desc: ""
      requires :identification_id, type:Integer,  desc: ""
    end
    get do
      Users.create(
        :name=>params[:name],
        :comment=>params[:comment],
        :icon_url=>params[:icon_url],
        :identification_id=>params[:identification_id]
      )
    end   
  end

  resource "get_all_feeds" do
    desc ""
    get do 
      Feeds.limit(999).order("id DESC")
    end
  end

  resource "get_feeds_by_id" do
    desc ""
    params do
      requires:id,type:Integer
    end
    get do
      Feeds.find(params[:id])
    end
  end

  resource "insert_feed" do
    desc ""
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
    get do
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

