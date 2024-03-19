require 'csv'

# Seed data from books.csv
CSV.foreach(Rails.root.join('db', 'books.csv'), headers: true) do |row|
  Book.create(
    title: row['Title'],
    authors: row['Author(s)'],
    published_date: row['Published Date']
  )
end

# Seed data from Faker for Magazines
Book.all.each do |book|
  5.times do
    Magazine.create!(
      title: Faker::Book.title,
      author: Faker::Book.author,
      # Random date within the last 5 years
      published_date: Faker::Date.backward(days: 365 * 5), 
      publisher: Faker::Book.publisher,
      book: book
    )
  end
end
