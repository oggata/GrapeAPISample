class API < Grape::API
  prefix "api"
  version 'v1', :using => :path
  format :json

  #header "Access-Control-Allow-Origin", "*"

  mount Books_API
  mount Articles_API
  mount Communities_API
  mount CommunityComments_API
end

