
# FactoryBotとかFaker使いたいけど、とりあえず。

ComicAuthor.delete_all
Author.delete_all
Comic.delete_all
Publisher.delete_all

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
  { name: "One Piece", published_on: "1997-07-22", price: 500, publisher: Publisher.find_by(name: "Shueisha") },
  { name: "Attack on Titan", published_on: "2009-09-09", price: 600, publisher: Publisher.find_by(name: "Kodansha") },
  { name: "Dragon Ball", published_on: "1984-12-03", price: 400, publisher: Publisher.find_by(name: "Shueisha") }
]

comics.each do |comic_data|
  Comic.create!(comic_data)
end

comic_authors = [
  { comic: Comic.find_by(name: "One Piece"), author: Author.find_by(name: "Eiichiro Oda") },
  { comic: Comic.find_by(name: "Attack on Titan"), author: Author.find_by(name: "Hajime Isayama") },
  { comic: Comic.find_by(name: "Dragon Ball"), author: Author.find_by(name: "Akira Toriyama") }
]

comic_authors.each do |comic_author_data|
  ComicAuthor.create!(comic_author_data)
end