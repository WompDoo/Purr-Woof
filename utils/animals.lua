local animals = { dogs = {}, cats = {} }

table.insert(animals["dogs"], { name = "D-Doggy", image = "pictures/dog1.png", description = "This is a cute doggy with a D"} )
table.insert(animals["dogs"], { name = "Doggy", image = "pictures/dog2.png", description = "This is a cute doggy without a D"} )
table.insert(animals["dogs"], { name = "Rolof", image = "pictures/husky.png", description = "The only dog who hired a professional photographer. Also a viking."} )

table.insert(animals["cats"], { name = "Fatsy", image = "pictures/cat1.png", description = "This is a cute, chubby cat"} )
table.insert(animals["cats"], { name = "El Gato", image = "pictures/cat2.png", description = "This is a swashbuckling Southern cat"} )
table.insert(animals["cats"], { name = "Fancy Cat", image = "pictures/cat3.png", description = "This is a very fancy cat"} )

return animals