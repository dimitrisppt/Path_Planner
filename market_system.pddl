(define (domain market_system)

(:requirements 
	:typing :durative-actions :numeric-fluents :equality)


(:types
	Location; ----Consider market as Location
	Vehicle; ---- Car already has a customer
	Product
)

(:predicates
	(isAvailableProd ?x - Location ?p - Product)
	(isBought ?p - Product ?v - Vehicle);---For now vehicle works as a customer
	(isAvailable ?x - Location ?p - Product);---Maybe this is action instead of predicate
	(hasRoute ?x - Location ?y - Location)
	(isMarket ?x - Location)
	(isAtLocation ?x - Location ?v - Vehicle)

)


(:functions
	
	(quantityProd ?x - Location ?p - Product) 
	(cost) - number;---We relaxed the cost as distance+time+product's price into a single thing
	(costLocation ?x - Location ?y - Location) 
	(costProduct ?p - Product ?x - Location) 
	(purchaseProd ?p - Product ?v - Vehicle) 
)


(:durative-action moveToLocation

     :parameters (?x - Location ?y - Location ?v - Vehicle)

     :duration (= ?duration (costLocation ?x ?y))

     :condition (and (at start (isAtLocation ?x ?v))
			(over all (hasRoute ?x ?y)));---For now we don't consider fuel cost

     :effect (and (at start (not (isAtLocation ?x ?v)));---Maybe can be substituted by 'over all'
			(at end (not (isAtLocation ?x ?v)))
			(at end (isAtLocation ?y ?v));----We don't care for fuel for the moment (we decrease if we had it)
			(at end (increase (cost)(costLocation ?x ?y))))
			)
		



(:action isAvailableProd
	
	:parameters (?x - Location ?p - Product)
	
	:precondition (and (isMarket ?x);---We might not need it, since is used only in buyProduct
			   (> (quantityProd ?x ?p) 0))

	:effect (isAvailableProd ?x ?p)

)

(:action buyProduct

	:parameters (?x - Location ?p - Product ?v - Vehicle)

	:precondition (and (isMarket ?x)
			   (isAtLocation ?x ?v)
			   (isAvailableProd ?x ?p))
			   
	:effect(and (decrease (quantityProd ?x ?p) 1)
		    (decrease (purchaseProd ?p ?v) 1)
		    (increase (cost) (costProduct ?p ?x)))

)

)



	
			   
			   

			
			

