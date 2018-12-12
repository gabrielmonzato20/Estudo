# ex 5 cs
points =174
price=''
if points <= 50:
	price = "wooden rabbit"
elif points <=150:
  price = ''
 elif points <=180:
 	price = "wafer-thin mint"
 else:
 	if price<=200:
 		price = "penguin"
if price == '':
	result = "Oh dear,no prize this time."
else:
	result = "Congratulations!You won a {}".format(price)
print(result)
# ex8 if igual