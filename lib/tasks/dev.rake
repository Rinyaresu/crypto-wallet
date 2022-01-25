namespace :dev do
  desc 'Configure development environment'
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting BD...") { %x(rails db:drop) }
      show_spinner("Creating BD...") { %x(rails db:create) }
      show_spinner("Migrating BD...") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts %x'You are not in development environment'
    end
  end

  desc 'Create coins'
  task add_coins: :environment do
    show_spinner("Signing up coins...") do
      coins = [
                {
                  description: 'Bitcoin',
                  acronym: 'BTC',
                  url_image: 'https://assets.chinatechnews.com/wp-content/uploads/bitcoin-logo.jpg'
                },
                {
                  description: 'Ethereum',
                  acronym: 'ETH',
                  url_image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZCRfwkqpPvFb3QmmwGONG2i6PsgnqZ3L7dRzCNlaSTB1-ruu5'
                },
                {
                  description: 'Shiba Inu Coin',
                  acronym: 'SHIBA',
                  url_image: 'https://s2.coinmarketcap.com/static/img/coins/200x200/5994.png'
                }
              ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc 'Create Mining Types'
  task add_mining_types: :environment do
    show_spinner("Signing up Mining Types...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end


    private

  def show_spinner(msg_start, msg_end = "Completed!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
