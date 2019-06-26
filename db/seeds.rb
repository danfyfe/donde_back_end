puts "SEEDING"

## users ##

dan = User.find_or_create_by(password:"123",username:"Dan", email:"fyfedaniel@gmail.com",image:"https://i.imgur.com/UFAMSqv.png")

meylin = User.find_or_create_by(password:"123",username:"Meylin",email:"meylinlopez08@gmail.com",image:"https://i.imgur.com/H7iqVi6.png")

mom = User.find_or_create_by(password:"123",username:"GG",email:"mom@mom.com",image:"https://i.imgur.com/6oYbQKy.png")


## households ##

apt = Household.find_or_create_by(name:"556 17th St",color:"lightblue", image:"https://i.imgur.com/GMOhUbb.png",password:"556")

montvale = Household.find_or_create_by(name:"Montvale", color:"blue", image:"https://i.imgur.com/GMOhUbb.png", password:"montvale")

lakehouse = Household.find_or_create_by(name:"Lake House", color:"orange",image:"https://i.imgur.com/GMOhUbb.png",password:"lakehouse")


## user_households ##

UserHoushold.find_or_create_by(user_id:dan.id,household_id:apt.id)
UserHoushold.find_or_create_by(user_id:meylin.id,household_id:apt.id)

UserHoushold.find_or_create_by(user_id:dan.id,household_id:montvale.id)
UserHoushold.find_or_create_by(user_id:mom.id,household_id:montvale.id)

UserHoushold.find_or_create_by(user_id:mom.id,household_id:lakehouse.id)


## spaces ##

storage_closet = Space.find_or_create_by(name:"Storage Closet", household_id:apt.id)

bedroom_closet = Space.find_or_create_by(name:"Dan and Meylin's Bedroom Closet", household_id:apt.id)

coat_closet = Space.find_or_create_by(name:"Coat Closet", household_id:apt.id)

basement = Space.find_or_create_by(name:"Basement", household_id:montvale.id)

attic = Space.find_or_create_by(name:"Attic", household_id:montvale.id)

upstairs = Space.find_or_create_by(name:"Upstairs", household_id:lakehouse.id)


## containers ##

imac_box = Container.find_or_create_by(name:"iMac Box", description:"iMac box", color:"white", space_id:storage_closet.id)

christmas_stuff = Container.find_or_create_by(name:"Chrismas stuff", description:"Colorful box with all the chrismas stuff", color:"green", space_id:storage_closet.id)

wig_box = Container.find_or_create_by(name:"Wig Box", description:"A colorful box full of Meylin's wigs", space_id:bedroom_closet.id)

none = Container.find_or_create_by(name:"", description:"", space_id:coat_closet.id)

clothes_box = Container.find_or_create_by(name:"Box of old clothes", description:"A brown box with DAN'S OLD CLOTHES written on it",color:"brown", space_id:attic.id)

guitar_case = Container.find_or_create_by(name:"Gibson case", description:"Case for the Les Paul", color:"orange", space_id:basement.id)

blanket_bin = Container.find_or_create_by(name:"Blanket bin", description:"Plastic bin full of blankets and sheets", color:"white", space_id:lakehouse.id)

## items ##

imac = Item.find_or_create_by(name:"iMac", description:"iMac computer", container_id:imac_box.id)

keyboard = Item.find_or_create_by(name:"keyboard", description:"keyboard for mac computer", container_id:imac_box.id)

ornaments = Item.find_or_create_by(name:"Chrismas Ornaments", description:"A bunch of christmas ornaments", container_id:christmas_stuff.id)

wig1 = Item.find_or_create_by(name:"Blonde Wig", description:"A blonde Bob wig", container_id:wig_box.id)
wig2 = Item.find_or_create_by(name:"Pink Wig", description:"A pink Bob wig", container_id:wig_box.id)
wig3 = Item.find_or_create_by(name:"Black Wig", description:"A black long wig", container_id:wig_box.id)

old_shirt1 = Item.find_or_create_by(name:"CBGB shirt", description:"Dan's old black CBGB shirt", container_id:clothes_box.id)
old_shirt2 = Item.find_or_create_by(name:"Metallica shirt", description:"Dan's old black Metallica shirt with green statue on it", container_id:clothes_box.id)
old_shirt3 = Item.find_or_create_by(name:"Metallica shirt", description:"Dan's old black Metallica shirt with photo of band on it", container_id:clothes_box.id)

les_paul = Item.find_or_create_by(name:"Les Paul", description:"Gibson Les Paul guitar", container_id:guitar_case.id)
les_paul_strap = Item.find_or_create_by(name:"Les Paul Strap", description:"The strap fot the Les Paul", container_id:guitar_case.id)


blanket1 = Item.find_or_create_by(name:"Old blanket", description:"Old comforter from the boy's rooms", container_id:blanket_bin.id)
blanket2 = Item.find_or_create_by(name:"Guest Blanket", description:"Comforter for the guests", container_id:blanket_bin.id)
blanket3 = Item.find_or_create_by(name:"Guest Blanket", description:"Comforter for the guests", container_id:blanket_bin.id)
blanket4 = Item.find_or_create_by(name:"Sheets", description:"5 white bed sheets", container_id:blanket_bin.id)























:puts "DONE SEEDING"