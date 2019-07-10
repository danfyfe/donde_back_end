puts "SEEDING"

## users ##

dan = User.create(password:"123",username:"Dan", email:"fyfedaniel@gmail.com",image:"https://i.imgur.com/UFAMSqv.png")

meylin = User.create(password:"123",username:"Meylin",email:"meylinlopez08@gmail.com",image:"https://i.imgur.com/H7iqVi6.png")

mom = User.create(password:"123",username:"GG",email:"mom@mom.com",image:"https://i.imgur.com/6oYbQKy.png")

desi = User.create(password:"123",username:"Desi",email:"none",image:"https://i.imgur.com/6oYbQKy.png")

matt = User.create(password:"123",username:"Matt",email:"none",image:"https://i.imgur.com/6oYbQKy.png")


## households ##

apt = Household.create(name:"556 17th St",color:"brown", image:"https://i.imgur.com/GMOhUbb.png",password:"123")

montvale = Household.create(name:"Montvale", color:"blue", image:"https://i.imgur.com/JSJ5Dk7.png", password:"123")

lakehouse = Household.create(name:"Lake House", color:"orange",image:"https://i.imgur.com/nKUQcrC.png",password:"123")



## user_households ##

# UserHousehold.find_or_create_by(user_id:dan.id,household_id:apt.id)
UserHousehold.find_or_create_by(user_id:meylin.id,household_id:apt.id)
UserHousehold.find_or_create_by(user_id:desi.id,household_id:apt.id)
UserHousehold.find_or_create_by(user_id:matt.id,household_id:apt.id)

UserHousehold.find_or_create_by(user_id:dan.id,household_id:montvale.id)
UserHousehold.find_or_create_by(user_id:mom.id,household_id:montvale.id)

UserHousehold.find_or_create_by(user_id:mom.id,household_id:lakehouse.id)


## spaces ##

storage_closet = Space.find_or_create_by(name:"Storage Closet", household_id:apt.id)

bedroom_closet = Space.find_or_create_by(name:"Dan and Meylin's Bedroom Closet", household_id:apt.id)

coat_closet = Space.find_or_create_by(name:"Coat Closet", household_id:apt.id)

kitchen_cabinet = Space.find_or_create_by(name:"Kitchen Cabinets", household_id:apt.id)

basement = Space.find_or_create_by(name:"Basement", household_id:montvale.id)

attic = Space.find_or_create_by(name:"Attic", household_id:montvale.id)

upstairs = Space.find_or_create_by(name:"Upstairs", household_id:lakehouse.id)


## containers ##

imac_box = Container.find_or_create_by(name:"iMac Box", description:"iMac box", color:"white", space_id:storage_closet.id)

flower_bag = Container.find_or_create_by(name:"Flower Bag", description:"A bag full of flower tools", color:"green", space_id:storage_closet.id)

christmas_stuff = Container.find_or_create_by(name:"Chrismas stuff", description:"Colorful box with all the chrismas stuff", color:"green", space_id:storage_closet.id)

wig_box = Container.find_or_create_by(name:"Wig Box", description:"A colorful box full of Meylin's wigs", space_id:bedroom_closet.id)

top_drawer = Container.find_or_create_by(name:"Top drawer", description:"Top drawer of the bottom left kitchen cabinet", space_id:kitchen_cabinet.id)

# none = Container.find_or_create_by(name:"", description:"", space_id:coat_closet.id)

clothes_box = Container.find_or_create_by(name:"Box of old clothes", description:"A brown box with DAN'S OLD CLOTHES written on it",color:"brown", space_id:attic.id)

guitar_case = Container.find_or_create_by(name:"Gibson case", description:"Case for the Les Paul", color:"orange", space_id:basement.id)

blanket_bin = Container.find_or_create_by(name:"Blanket bin", description:"Plastic bin full of blankets and sheets", color:"white", space_id:upstairs.id)

## items ##

imac = Item.find_or_create_by(name:"iMac", description:"iMac computer", container_id:imac_box.id)

keyboard = Item.find_or_create_by(name:"keyboard", description:"keyboard for mac computer", container_id:imac_box.id)

ornaments = Item.find_or_create_by(name:"Chrismas Ornaments", description:"A bunch of christmas ornaments", container_id:christmas_stuff.id)

wig1 = Item.find_or_create_by(name:"Blonde Wig", description:"A blonde Bob wig", container_id:wig_box.id)
wig2 = Item.find_or_create_by(name:"Pink Wig", description:"A pink Bob wig", container_id:wig_box.id)
wig3 = Item.find_or_create_by(name:"Black Wig", description:"A black long wig", container_id:wig_box.id)

nutribullet = Item.find_or_create_by(name:"NutriBullet", description:"NutriBullet blender", container_id:top_drawer.id)

clippers = Item.find_or_create_by(name:"Clippers", description:"Flower clippers", container_id:flower_bag.id)


old_shirt1 = Item.find_or_create_by(name:"CBGB shirt", description:"Dan's old black CBGB shirt", container_id:clothes_box.id)
old_shirt2 = Item.find_or_create_by(name:"Metallica shirt", description:"Dan's old black Metallica shirt with green statue on it", container_id:clothes_box.id)
old_shirt3 = Item.find_or_create_by(name:"Metallica shirt", description:"Dan's old black Metallica shirt with photo of band on it", container_id:clothes_box.id)

les_paul = Item.find_or_create_by(name:"Les Paul", description:"Gibson Les Paul guitar", container_id:guitar_case.id)
les_paul_strap = Item.find_or_create_by(name:"Les Paul Strap", description:"The strap fot the Les Paul", container_id:guitar_case.id)

# user items
UserItem.create(user_id:dan.id,item_id:les_paul.id)
UserItem.create(user_id:dan.id,item_id:imac.id)
UserItem.create(user_id:dan.id,item_id:les_paul_strap.id)
UserItem.create(user_id:meylin.id,item_id:wig1.id)
UserItem.create(user_id:meylin.id,item_id:wig2.id)
UserItem.create(user_id:meylin.id,item_id:wig3.id)
UserItem.create(user_id:dan.id,item_id:ornaments.id)
UserItem.create(user_id:meylin.id,item_id:ornaments.id)
UserItem.create(user_id:desi.id,item_id:clippers.id)





blanket1 = Item.find_or_create_by(name:"Old blanket", description:"Old comforter from the boy's rooms", container_id:blanket_bin.id)
blanket2 = Item.find_or_create_by(name:"Guest Blanket", description:"Comforter for the guests", container_id:blanket_bin.id)
blanket3 = Item.find_or_create_by(name:"Guest Blanket", description:"Comforter for the guests", container_id:blanket_bin.id)
blanket4 = Item.find_or_create_by(name:"Sheets", description:"5 white bed sheets", container_id:blanket_bin.id)





## messages ##
Message.create(user_id:meylin.id, household_id:apt.id, title:"NutriBullet", content:"Can I throw out the NutriBullet? I don't think we need it now that we have that new blender.")

# Message.create(user_id:dan.id, household_id:apt.id, title:"re: NutriBullet", content:"Sounds good to me!")

# Message.create(user_id:meylin.id, household_id:apt.id, title:"NutriBullet has been deleted!", content:"Meylin has deleted NutriBullet! Item description: NutriBullet blender")

Message.create(user_id:mom.id, household_id:montvale.id, title:"Do you want these shirts?", content:"I found two Metallica shirts, can I throw them out or do you want them?")

# Message.create(user_id:meylin.id, household_id:apt.id, title:"re: Where is the waffle iron?!", content:"I don't know.")















puts "DONE SEEDING"