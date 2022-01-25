# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Coin.create!(
  description: 'Bitcoin',
  acronym: 'BTC',
  url_image: 'https://tradingplatforms.com/pt/wp-content/uploads/sites/27/2021/04/Bitcoin-Logo-1024x576.png'
)

Coin.create!(
  description: 'Shiba Inu Coin',
  acronym: 'SHIBA',
  url_image: 'https://s2.coinmarketcap.com/static/img/coins/200x200/5994.png'
)

Coin.create!(
  description: 'Ethereum',
  acronym: 'ETH',
  url_image: 'https://d33wubrfki0l68.cloudfront.net/fcd4ecd90386aeb50a235ddc4f0063cfbb8a7b66/4295e/static/bfc04ac72981166c740b189463e1f74c/40129/eth-diamond-black-white.jpg'
)