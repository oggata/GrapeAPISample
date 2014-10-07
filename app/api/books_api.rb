class Books_API < Grape::API

obj = Books.create(:title => 'aaaaaa')


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

