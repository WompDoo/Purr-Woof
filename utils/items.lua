local items = { }

table.insert(items, { 
  id = 1,
  type = { dog = true, cat = false, food = true, toy = false },
  name = "Dog food", 
  image = "pictures/items/dogfood.png"} )
table.insert(items, { 
  id = 2,
  type = { dog = false, cat = false, food = false, toy = true },
  name = "Red ball", 
  image = "pictures/items/ball.png"} )
table.insert(items, { 
  id = 3,
  type = { dog = false, cat = false, food = false, toy = true },
  name = "Tennis ball", 
  image = "pictures/items/tennisball.png"} )
table.insert(items, { 
  id = 4,
  type = { dog = true, cat = false, food = false, toy = true },
  name = "Chewbone",
  image = "pictures/items/chewbone.png"} )
table.insert(items, { 
  id = 5,
  type = { dog = false, cat = false, food = true, toy = false },
  name = "Chicken leg", 
  image = "pictures/items/chickenleg.png"} )
table.insert(items, { 
  id = 6,
  type = { dog = false, cat = false, food = true, toy = false },
  name = "Hot Dog", 
  image = "pictures/items/hotdog.png"} )
table.insert(items, { 
  id = 7,
  type = { dog = false, cat = false, food = true, toy = false },
  name = "Steak", 
  image = "pictures/items/steak.png"} )
table.insert(items, { 
  id = 8,
  type = { dog = false, cat = true, food = false, toy = true },
  name = "Yarn", 
  image = "pictures/items/yarn.png"} )
table.insert(items, { 
  id = 9,
  type = { dog = false, cat = true, food = false, toy = true },
  name = "Toy mouse", 
  image = "pictures/items/toymouse.png"} )
table.insert(items, { 
  id = 10,
  type = { dog = false, cat = false, food = true, toy = false },
  name = "Pizza", 
  image = "pictures/items/pizza.png"} )
return items