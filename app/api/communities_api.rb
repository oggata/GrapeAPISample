class Communities_API < Grape::API
  
  before do
    header "Access-Control-Allow-Origin", "*"
    header "Access-Control-Allow-Methods","GET,POST,OPTIONS"
    header "Access-Control-Allow-Headers","*"
  end

  resource "communities" do
    desc ""
    get do
      Communities.limit(999).order("id DESC")
    end
  end

  resource "community" do
    desc ""
    params do
      requires:id,type:Integer
    end
    get do
      Communities.where('id = ?',params[:id])
    end
  end

  resource "save_community" do
    desc ""
    params do
      requires :title, type:String, desc: ""
      requires :comment, type:String,  desc: ""
      requires :tag, type:String,  desc: ""
      requires :thumbnail_url, type:String,  desc: ""
      requires :url, type:String, desc: ""
    end
    get do
      Communities.create(
        :title=>params[:title],
        :comment=>params[:comment],
        :tag=>params[:tag],
        :thumbnail_url=>params[:thumbnail_url],
        :url=>params[:url]
      )
    end
  end

end

