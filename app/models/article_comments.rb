class ArticleComments < ActiveRecord::Base
  belongs_to :articles
end
