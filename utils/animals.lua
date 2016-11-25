local animals = { dogs = {}, cats = {} }

table.insert(animals["dogs"], { 
  id = 1,
  name = "D-Doggy", 
  image = "pictures/dog1.png",
  yardimage = "", 
  description = "This is a cute doggy with a D"} )
table.insert(animals["dogs"], { 
  id = 2,
  name = "Doggy", 
  image = "pictures/dog2.png",
  yardimage = "",  
  description = "This is a cute doggy without a D"} )
table.insert(animals["dogs"], { 
  id = 3,
  name = "Rolof", 
  image = "pictures/husky.png", 
  yardimage = "pictures/trusky.png", 
  description = "The only dog who hired a professional photographer. Also a viking."} )

table.insert(animals["cats"], { 
  id = 4,
  name = "Fatsy", 
  image = "pictures/cat1.png", 
  yardimage = "", 
  description = "This is a cute, chubby cat"} )
table.insert(animals["cats"], { 
  id = 5,
  name = "El Gato", 
  image = "pictures/cat2.png",
  yardimage = "",  
  description = "This is a swashbuckling Southern cat"} )
table.insert(animals["cats"], { 
  id = 6,
  name = "Fancy Cat", 
  image = "pictures/cat3.png", 
  yardimage = "", 
  description = "This is a very fancy cat"} )

return animals