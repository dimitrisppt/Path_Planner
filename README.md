# Efficient Shopping Report
 ## *4CCS1IAI - Introduction to Artificial Intelligence*
 
 ### General Description
 Implementation of an application that search for the most efficient path for a car to take, to purchase the cheapest groceries from several shops using the least amount of fuel.
 
 ### Relaxed Situation
 To achieve an acceptable heuristic for the problem, we included the distance of the journey in the total
cost. We also cogitated that the car has no fuel limit, meaning that the distance driven is not high
enough to be taken into account (the vehicle never needs to be charged). However, examining a real life
situation, returning home because of the lack of boot capacity is a necessity, therefore, it is
included in our implementation.

Each product has its own volume, meaning that the action of buying an item has as result an update in
the boot capacity left. Since there exists the possibility of running out of boot capacity, when the
customer gets home, he or she moves the products from the vehicle in the house and we assign the
boot capacity left to the actual boot capacity of the car.

There are also limitations that we took to assure that the problems are solved in an optimal time of
execution. Using the **OPTIC planner**, we have noticed that the `-N` tag is used for giving a solution
without minimizing the cost, which made us search for a better tag to fit our problem, therefore we are
using the `-E` tag. Because of using the `-E` tag, the number of possibilities for the program needs to
be significantly lower. On the other hand, the advantage is that the planner outputs the best possible
solution at the end.

The aforementioned limitations include having a single customer for each problem file and having a
single home for the customer. In practice, having more than one customer for one problem file can be
redundant, if we think the program as being used by a single person, because there would not be the
case of putting more than one shopping list at once. Thus, using limitations reduces the complexity of
the program and produces an optimal result in an efficient time.

### Model Implementation
- Traveling from one place to another
- A customer with a car that has a boot capacity (if the capacity is full it will have to empty it and
come back
- Fuel consumed by the car from one distance to another
- Ability of a customer to buy a product from a shop at a certain price
- The customer can go Home

### Objects
- **Location:** There will be in our problem different location that can be shops , home or normal location
- **Vehicle:** A customer will have a vehicle with a boot capacity to drive to places
- **Customer:** A customer will be the one shopping products . A customer has a name
- **Product:** Each products have a name , and are available at different quantities in a different shop and
they will have different prices.

### Predicates
- **isAvailable ?x - Location ?p** – **Product:** says if a product is available at a location
- **hasRoute ?x - Location ?y** – **Location:** says if there is a route/ way from one location to another
- **isMarket ?x** – **Location:** says if a location is a market or not
- **isHome ?x** – **Location:** says if the location is the home
- **isAtHome ?c – **Customer:** checks if the customer is at home
- **isAtLocation ?x - Location ?c** – **Customer:** says at which location the customer is
- **isInVehicle ?c - Customer ?v** – **Vehicle:** says which vehicle the customer is in

### Functions
- **quantityProd ?x - Location ?p** – **Product:** This will indicate the quantity of a product at a shop
- **bootCapacity ?v** – **Vehicle:** This will indicate in litres the boot volume and capacity of a car
- **bootVolumeLeft ?v** – **Vehicle:** This is the volume left , volume that will decrease by the product’s
volume
- **volumeProduct ?p - Product ?x** – **Location:** This will indicate the volume in Litres of a product
- **cost:** We relaxed the cost as distance+product's price
- **money ?c** – **Customer:** this will indicate the amount of money a customer has
- **costLocation ?x - Location ?y** – **Location:** this indicates how much it costs to move from one
location to another
- **costProduct ?p - Product ?x** – **Location:** This is the price of a product in a shop , it will depend of the
shop
- **purchaseProd ?p - Product ?c** – **Customer:** this indicates how much of a product a customer needs to
purchase and it will thus help us to determin the goal of the program as it is to have 0 products on the
list.

### Actions
There are 3 different actions. Each action is a durative action as it takes place along the program.

**moveToLocation** 
*It defines the action to move a vehicle from a point A to point B. It has a duration
which is the distance between those two locations. Every time the vehicle moves the cost increases by
the distance from the next location.*

**releaseProducts**
*It defines the action to move and release all purchased products at home. It has a
duration which is identified by the distance of the two locations. Checks whether the vehicle is at
home in the end and releases the products.*

**buyProduct**
*It defines the action to buy a product from the market. It has a duration which is the
cost of the product from that market. Every time a product is purchased the boot's volume decreases
by the volume of each product.*

### Extensions

Continuously trying to make the domain as close to real life as possible can lead to extensions of the
current program. One of them would be the capability of the customer to enter/exit a vehicle, that we
considered unnecessary for this domain, at the current level of development. Another extension would
imply the customer having more than one shopping list, including the order that those shopping lists
are prioritised.

### Conclusions

Being a very common activity, shopping became a habit. Thus, to be as quick as possible, everyone
omits taking into account the amount of money they spent and go to the closest market. The
consequences of their action have a significant impact on their financial situation in time. Our PDDL
domain finds the right balance between time and cost. For instance, in our problem files the customers
go to multiple shops to optimize the expenditures.


