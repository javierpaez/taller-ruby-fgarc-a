require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:valid_attributes) { { title: "Book", author: "John", publication_year: 1990 } }
  let(:invalid_attributes) { { title: nil, author: "John", publication_year: 1990 } }
  
  describe "GET #index" do
    it "returns a success response" do
      Book.create!(valid_attributes)
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      book = Book.create!(valid_attributes)
      get :show, params: { id: book.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new book" do
        expect {
          post :create, params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end
    end

    context "with invalid params" do
      it "returns unprocessable entity" do
        post :create, params: { book: invalid_attributes }
        expect(response.message).to eq "Unprocessable Content"
      end
    end
  end

  describe "DELETE" do
    it "should destroy the record" do
      book = Book.create!(valid_attributes)
      delete :destroy, params: { id: book.id }
      expect(response.message).to eq 'No Content'
    end
  end
end