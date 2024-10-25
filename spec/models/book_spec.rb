require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with correct attributes" do
    book = Book.new(title: "Book", author: "John", publication_year: 1990)
    expect(book).to be_valid
  end

  it "is not valid withoud a title" do
    book = Book.new(title: nil, author: "John", publication_year: 1990)
    expect(book).not_to be_valid
  end
end