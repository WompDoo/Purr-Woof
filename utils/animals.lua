local animals = { dogs = {}, cats = {} }

table.insert(animals["dogs"], { 
  id = 1,
  baseurl = "pictures/animals/ddoggy/",
  name = "D-Doggy", 
  description = "This is a cute doggy with a D"} )
table.insert(animals["dogs"], { 
  id = 2,
  baseurl = "pictures/animals/doggy/",
  name = "Doggy", 
  description = "This is a cute doggy without a D"} )
table.insert(animals["dogs"], { 
  id = 3,
  baseurl = "pictures/animals/rolof/",
  name = "Rolof",
  description = "The only dog who hired a professional photographer. Also a viking."} )

table.insert(animals["cats"], { 
  id = 4,
  baseurl = "pictures/animals/fatsy/",
  name = "Fatsy",
  description = "This is a cute, chubby cat"} )
table.insert(animals["cats"], { 
  id = 5,
  baseurl = "pictures/animals/elgato/",
  name = "El Gato",  
  description = "This is a swashbuckling Southern cat"} )
table.insert(animals["cats"], { 
  id = 6,
  baseurl = "pictures/animals/fancycat/",
  name = "Fancy Cat", 
  description = "This is a very fancy cat"} )

return animals