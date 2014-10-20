class CommunityComments_API < Grape::API
  
  before do
    header "Access-Control-Allow-Origin", "*"
    header "Access-Control-Allow-Methods","GET,POST,OPTIONS"
    header "Access-Control-Allow-Headers","*"
  end

  resource "community_comments" do
    desc ""
    get do
      CommunityComments.limit(999).order("id DESC")
    end
  end

  resource "community_comment" do
    desc ""
    params do
      requires:id,type:Integer
    end
    get do
      CommunityComments.where('id = ?',params[:id])
    end
  end

  resource "save_community_comment" do
    desc ""
    params do
      requires :community_id, type:String, desc: ""
      requires :title, type:String, desc: ""
      requires :comment, type:String, desc: ""
      requires :user_id, type:Integer, desc: ""
      requires :name, type:String,  desc: ""
      requires :icon_url, type:String, desc: ""
    end
    get do
      CommunityComments.create(
        :community_id=>params[:community_id],
        :title=>params[:title],
        :comment=>params[:comment],
        :user_id=>params[:user_id],
        :name=>params[:name],
        :icon_url=>params[:icon_url]
      )
    end
  end

end

