namespace :dev do
  desc "Popula os recursos da aplicação"
  task setup: :environment do

    puts "====> Cadastrando tipos de contatos"
    kinds = ['Amigo(a)', 'Colega', 'Conhecido(a)', 'Família', 'Trabalho']
    kinds.each do |kind|
      Kind.create!(description: kind)
    end
    puts "====> Tipos de contatos cadastrados com sucesso! :)"

    puts "====> Cadastrando contatos"
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65) ,
        kind: Kind.all.sample
      )
    end
    puts "====> Tipos de contatos cadastrados com sucesso! :)"

    puts "====> Cadastrando telefones"
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    puts "====> Telefones cadastrados com sucesso! :)"

    puts "====> Cadastrando endereços..."
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.city,
        city: Faker::Address.street_address,
        contact: contact
      )
    end
    puts "====> Endereços cadastrados com sucesso! :)"

  end

end
