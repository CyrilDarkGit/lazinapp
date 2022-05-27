# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

puts "Destroying DB"
Booking.destroy_all
Offer.destroy_all
User.destroy_all
puts "Destroyed DB"

puts "Creating users…"

user1 = User.create!(email: 'test@test.com', username: 'Cyril', password: 'azerty')
user2 = User.create!(email: 'test2@test.com', username: 'Jules', password: 'azerty')
user3 = User.create!(email: 'test3@test.com', username: 'Marine', password: 'azerty')
user4 = User.create!(email: 'test4@test.com', username: 'Lina', password: 'azerty')

user1.photo.attach(io: File.open(Rails.root.join('app/assets/images/patrick-balkany.jpg')), filename: 'patrick-balkany.jpg')
user2.photo.attach(io: File.open(Rails.root.join('app/assets/images/BigLebowski.jpg')), filename: 'BigLebowski.png')

puts "Creating offers…"

offer1 = Offer.new(
  user: user1,
  name: 'I will stand in the line for you!',
  unit_price: 3500,
  overview: "At the mall, at Pôle Emploi or in any other long administration line, I will queue for you anywhere! Try me!",
  location: "40 Bd Haussmann, 75009 Paris",
  category: "Other",
  currency: 'EUR'
)
offer1.photo.attach(
  io: URI.open('https://static.needhelp.fr/photojobbing/88-1599661181.jpg'),
  filename: 'anyname.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg'
  )
offer1.save!

offer2 = Offer.new(
  user: user1,
  name: "Tinder's professionnal",
  unit_price: 1200,
  overview: "I swipe for you and send you a selection of juicy matches",
  location: 'Oberkampf, Paris',
  category: "Social",
  currency: 'EUR'
)
offer2.photo.attach(
  io: URI.open('https://imgr.cineserie.com/2022/02/simon-leviev-instagram-tinder.jpg?imgeng=/f_jpg/cmpr_0/w_660/h_370/m_cropbox&ver=1'),
  filename: 'anyname.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg'
  )
offer2.save!

offer3 = Offer.new(
  user: user1,
  name: 'I would volunteer for you',
  unit_price: 500,
  overview: 'You want to shine among your friends while seatting in your couch, I will volunteer for you and bring you all the glory.',
  location: 'Ménilmontant, Paris',
  category: "Social",
  currency: 'EUR'
)
offer3.photo.attach(
  io: URI.open('https://jereussis.teluq.ca/files/2020/09/septembre2020_05_article.jpg'),
  filename: 'anyname.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg'
  )
offer3.save!

offer4 = Offer.new(
  user: user1,
  name: "I'm going to strike for you",
  unit_price: 200,
  overview: "You want to commit and fight but you have no time nor balls, I'm your man !",
  location: 'République, Paris',
  category: "Other",
  currency: 'EUR'
)
offer4.photo.attach(
  io: URI.open('https://pbs.twimg.com/media/DJhnjH7XkAMgyL0?format=jpg&name=large'),
  filename: 'anyname.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg'
  )
offer4.save!


offer5 = Offer.new(
  user: user1,
  name: 'Apologizing Service',
  unit_price: 150,
  overview: 'I apologize for you: message, letters, in person... your choice!',
  location: 'Chatelet, Paris',
  category: "Social",
  currency: 'EUR'
)
offer5.photo.attach(
  io: URI.open('https://img.huffingtonpost.com/asset/5b5f65a51900001603500b66.jpg?cache=0ha5M2UfIm&ops=scalefit_720_noupscale&format=webp'),
  filename: 'anyname.webp', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/webp'
  )
offer5.save!

offer6 = Offer.new(
  user: user2,
  name: 'Your Exam',
  unit_price: 500,
  overview: 'Math, History, Geography all topics!  ',
  location: 'Pere-Lachaise, Paris',
  category: "Study",
  currency: 'EUR'
)

offer6.photo.attach(
  io: URI.open('https://www.telemagplus.re/photo/art/default/57236142-42438787.jpg?v=1625570092'),
  filename: 'anyname.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg'
  )
offer6.save!

offer7 = Offer.new(
  user: user2,
  name: 'Your Homework',
  unit_price: 300,
  overview: 'Math, History, Geography all topics!  ',
  location: 'Massy palaiseau, France',
  category: "Study",
  currency: 'EUR'
)

offer7.photo.attach(
  io: URI.open('https://www.learningandthebrain.com/blog/wp-content/uploads/2015/12/Homework-Help.png'),
  filename: 'anyname.png', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/png'
  )
offer7.save!

offer8 = Offer.new(
  user: user2,
  name: 'Run most of the race for you',
  unit_price: 1000,
  overview: "You'll have the medal and the pics",
  location: 'Louvre, Paris',
  category: "Sport",
  currency: 'EUR'
)

offer8.photo.attach(
  io: URI.open('https://media.istockphoto.com/photos/cheerful-marathon-runner-greeting-group-of-athletes-at-finish-line-picture-id1095845222?s=612x612'),
  filename: 'anyname.png', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/png'
  )
offer8.save!

offer9 = Offer.new(
  user: user2,
  name: 'Proxy Job Quitters',
  unit_price: 1000,
  overview: 'Avoid any confrotation!',
  location: 'Saint-Michel, Paris',
  category: "Social",
  currency: 'EUR'
)

offer9.photo.attach(
  io: URI.open('https://firsthand.co/_next/image?url=https%3A%2F%2Fmedia2.vault.com%2F16443%2Fwomen_h.jpg&w=1920&q=75'),
  filename: 'anyname.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg'
  )
offer9.save!

offer10 = Offer.new(
  user: user2,
  name: 'Family calls - Auntie',
  unit_price: 100,
  overview: 'We make sure you get in touch!  ',
  location: 'Ternes, Paris',
  category: "Family",
  currency: 'EUR'
)

offer10.photo.attach(
  io: URI.open('https://www.theonlinemom.com/wp-content/uploads/2014/11/grandma-using-a-phone.jpg'),
  filename: 'anyname.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg'
  )
offer10.save!


puts "Creating bookings…"

Booking.create!(
  user: user1,
  offer: offer6,
  date: Date.today,
  status: 'pending'
)

Booking.create!(
  user: user1,
  offer: offer7,
  date: Date.today,
  status: 'pending'
)

Booking.create!(
  user: user3,
  offer: offer1,
  date: Date.parse('25th Jun 2022'),
  status: 'pending'
)

Booking.create!(
  user: user2,
  offer: offer2,
  date: Date.parse('15th Jun 2022'),
  status: 'pending'
)

Booking.create!(
  user: user3,
  offer: offer3,
  date: Date.parse('16th Jun 2022'),
  status: 'pending'
)

Booking.create!(
  user: user2,
  offer: offer2,
  date: Date.parse('12th Jun 2022'),
  status: 'pending'
)

Booking.create!(
  user: user2,
  offer: offer5,
  date: Date.parse('12th May 2022'),
  status: 'pending'
)

Booking.create!(
  user: user1,
  offer: offer6,
  date: Date.parse('10th May 2022'),
  status: 'decline'

)

Booking.create!(
  user: user1,
  offer: offer10,
  date: Date.parse('14th Jul 2021'),
  status: 'validate'
)

Booking.create!(
  user: user1,
  offer: offer8,
  date: Date.parse('3rd Dec 2022'),
  status: 'validate'
)

puts " DB created ! "
