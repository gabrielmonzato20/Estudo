def paty_planner(people ,cook):
	cooks = cook // people
	left = people % cook

	print("Good! Your Paty will have {} people witch a total of {} cookies  each people will eat {}and will left {}".format(people,cook,cooks,left)) 	
	
paty_start = 'y'
while paty_start == 'y':
	while True:
			try:
				people = int(input("Enter how many peoples will go to the paty"))
				cooks = int(input("Enter wich the number of cooks"))
				q = cooks // people
				break
			except ZeroDivisionError:
				print("no have people Please give a number gretter then 0")
		
	
	paty_planner(people,cooks)
	paty_start="n"
else:
	print("bye")

