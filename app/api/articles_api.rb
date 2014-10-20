class Articles_API < Grape::API
  
  before do
    header "Access-Control-Allow-Origin", "*"
    header "Access-Control-Allow-Methods","GET,POST,OPTIONS"
    header "Access-Control-Allow-Headers","*"
  end

  resource "articles" do
    desc ""
    get do
      Articles.limit(999).order("id DESC")
    end
  end

  resource "article" do
    desc ""
    params do
      requires:id,type:Integer
    end
    get do
      Users.where('id = ?',params[:id])
    end
  end

  resource "save_article" do
    desc ""
    params do
      requires :title, type:String, desc: ""
      requires :detail, type:String,  desc: ""
      requires :tag, type:String,  desc: ""
      requires :thumbnail_url, type:String,  desc: ""
      requires :url, type:String, desc: ""
    end
    get do
      Articles.create(
        :title=>params[:title],
        :detail=>params[:detail],
        :tag=>params[:tag],
        :thumbnail_url=>params[:thumbnail_url],
        :url=>params[:url]
      )
    end
  end

end

