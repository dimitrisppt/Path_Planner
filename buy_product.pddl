(define (problem buy_product)

(:domain market_system)

(:objects
	
	Mario - Vehicle
	Temple Bank Saintsbury Towerhill Lidl Tesco - Location
	Flour Eggs - Product )

(:init 

	(isMarket Saintsbury)
	(isMarket Lidl)
	(isMarket Tesco)
	(= (cost) 0)
	(isAtLocation Temple Mario)
	

	(hasRoute Temple Bank)
	(= (costLocation Temple Bank) 2)
	(hasRoute Bank Temple)
	(= (costLocation Bank Temple) 2)

	(hasRoute Bank Saintsbury)
	(= (costLocation Bank Saintsbury) 2)
	(hasRoute Saintsbury Bank)
	(= (costLocation Saintsbury Bank) 2)

	(hasRoute Saintsbury Towerhill)
	(= (costLocation Saintsbury Towerhill) 2)
	(hasRoute Towerhill Saintsbury)
	(= (costLocation Towerhill Saintsbury) 2)

	(hasRoute Towerhill Lidl)
	(= (costLocation Towerhill Lidl) 2)
	(hasRoute Lidl Towerhill)
	(= (costLocation Lidl Towerhill) 2)

	(hasRoute Temple Towerhill)
	(= (costLocation Temple Towerhill) 4)
	(hasRoute Towerhill Temple)
	(= (costLocation Towerhill Temple) 4)

	(hasRoute Lidl Tesco)
	(= (costLocation Lidl Tesco) 2)
	(hasRoute Tesco Lidl)
	(= (costLocation Tesco Lidl) 2)

	(hasRoute Bank Tesco)
	(= (costLocation Bank Tesco) 2)
	(hasRoute Tesco Bank)
	(= (costLocation Tesco Bank) 2)


	
	(isAvailable Lidl Flour)
	(= (costProduct Flour Lidl) 1)
	(= (quantityProd Lidl Flour) 2)
	
	(isAvailable Lidl Eggs)
	(= (costProduct Eggs Lidl) 2)
	(= (quantityProd Lidl Eggs) 4)



	(isAvailable Tesco Flour)
	(= (costProduct Flour Tesco) 4)
	(= (quantityProd Tesco Flour) 3)

	(isAvailable Tesco Eggs)
	(= (costProduct Eggs Tesco) 3)
	(= (quantityProd Tesco Eggs) 8)

	


	(isAvailable Saintsbury Flour)
	(= (costProduct Flour Saintsbury) 2)
	(= (quantityProd Saintsbury Flour) 1)




	(= (purchaseProd Eggs Mario) 12)
	(= (purchaseProd Flour Mario) 4)
)
(:goal
	
	(and (= (purchaseProd Eggs Mario) 0)
	     (= (purchaseProd Flour Mario) 0)
	     (isAtLocation Temple Mario))
)





(:metric minimize (cost))

)

	


