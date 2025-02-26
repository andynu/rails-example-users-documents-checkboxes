# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create sample books
documents = [
  { title: 'The Hitchhiker\'s Guide to the Galaxy', content: 'Don\'t panic! A hilarious adventure through space' },
  { title: 'Harry Potter and the Sorcerer\'s Stone', content: 'The boy who lived comes to Hogwarts' },
  { title: 'The Cat in the Hat', content: 'A rainy day adventure with a tall talking cat' },
  { title: 'Where the Wild Things Are', content: 'Max\'s wild journey to where the wild things are' },
  { title: 'Charlie and the Chocolate Factory', content: 'A magical tour through Willy Wonka\'s factory' }
].map { |doc| Document.create!(doc) }

# Create sample users with their favorite books
users = [
  { 
    name: 'Luna Lovegood',
    documents: [documents[0], documents[1]]  # Sci-fi and magic fan
  },
  {
    name: 'Sam Smile',
    documents: [documents[2], documents[3]]  # Children's classics lover
  },
  {
    name: 'Bookworm Barry',
    documents: documents  # Loves all books!
  },
  {
    name: 'Candy Carson',
    documents: [documents[1], documents[4]]  # Magical adventures enthusiast
  }
].each { |user_data| 
  user = User.create!(name: user_data[:name])
  user.documents << user_data[:documents]
}
