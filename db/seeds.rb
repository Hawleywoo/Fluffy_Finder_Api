# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserBreed.destroy_all
Breed.destroy_all
User.destroy_all

# andrew = User.create(username: 'andrew', password: 'something', email: 'something@gmaill.com')
# dog = Breed.create(name: 'dog')
# UserBreed.create(user: andrew, breed: dog)

response = RestClient.get('https://api.thedogapi.com/v1/breeds', headers: {'x-api-key': ENV['API_KEY']})
breeds = JSON.parse response
breeds.map do |breed|
    id = 'id'
    response = RestClient.get("https://api.thedogapi.com/v1/images/search?breed_id=#{breed[id]}", headers: {'x-api-key': ENV['API_KEY']})
    image = JSON.parse(response)

    Breed.create(
        name: breed['name'],
        weight: breed['weight']['imperial'],
        height: breed['height']['imperial'],
        temperament: breed['temperament'],
        life_span: breed['life_span'],
        origin: breed['origin'],
        breed_group: breed['breed_group'],
        image_url: image[0]['url']
    )
end
