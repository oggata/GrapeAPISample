class Articles < ActiveRecord::Base
  has_many :article_comments
end
