# seed data user 1
# <editor-fold
u = User.create({
        name:"Anna",
        email:"manna@gmill.com",
        password:"123"
      })

t = u.trips.create({
        duration:7,
        pax:3,
        budget: 5000
      })

i = t.itineraries.create({})

p = i.places.create({
        name:"Jurong",
        lat:1.3329,
        lng:103.7436,
        price_pax: 15,
        duration: 4
    })

p.categories.create({name:"fun"})
# </editor-fold>

# seed data user 2
# <editor-fold
u2 = User.create({
        name:"Jovil",
        email:"kilonom@fire.org",
        password:"abc"
      })

t2 = u2.trips.create({
        duration:5,
        pax:9,
        budget: 3000
      })

i2 = t2.itineraries.create({})

p2 = i2.places.create({
        name:"Kamchatka",
        lat:56.1327,
        lng:159.5314,
        price_pax: 1500,
        duration: 250
    })

p2.categories.create({name:"adventure"})
# </editor-fold>

# l = Location.create({ name:"Spacemob", lat:1.3078123, long:103.8316541})

# start_date:DateTime.new(DateTime.now.year,DateTime.now.month,DateTime.now.day,15,0,0,'+08:00'),
# end_date:DateTime.new(DateTime.now.year,DateTime.now.month,DateTime.now.day+7,9,0,0,'+08:00'),
