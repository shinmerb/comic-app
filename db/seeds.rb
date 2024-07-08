publishers = [
  { name: "Shueisha", address: "Tokyo, Japan" },
  { name: "Kodansha", address: "Tokyo, Japan" },
  { name: "Shogakukan", address: "Tokyo, Japan" }
]

publishers.each do |publisher_data|
  Publisher.create!(publisher_data)
end

authors = [
  { name: "Eiichiro Oda", birthday: "1975-01-01" },
  { name: "Hajime Isayama", birthday: "1986-08-29" },
  { name: "Akira Toriyama", birthday: "1955-04-05" }
]

authors.each do |author_data|
  Author.create!(author_data)
end

comics = [
  {
    name: "One Piece", 
    published_on: "1997-07-22", 
    price: 500, 
    publisher: Publisher.find_by(name: "Shueisha"),
    comic_authors_attributes: [
      { author: Author.find_by(name: "Eiichiro Oda") }
    ]
  },
  { 
    name: "Attack on Titan", 
    published_on: "2009-09-09", 
    price: 600, 
    publisher: Publisher.find_by(name: "Kodansha"),
    comic_authors_attributes: [
      { author: Author.find_by(name: "Hajime Isayama") }
    ]
  },
  { 
    name: "Dragon Ball", 
    published_on: "1984-12-03", 
    price: 400, 
    publisher: Publisher.find_by(name: "Shueisha"),
    comic_authors_attributes: [
      { author: Author.find_by(name: "Akira Toriyama") }
    ]
  }
]

comics.each do |comic_data|
  Comic.create!(comic_data)
end
