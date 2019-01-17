manifest = [("bananas", 15), ("mattresses", 24), ("dog kennels", 42), ("machine", 120), ("cheeses", 5)]
weigth = 0 
items = []
for item in manifest:
    if weigth >100:
        break 
    else:
        if weigth + item[1] >100:
            continue
        else:
            weigth+=item[1]
            items.append(item[0])
print(weigth)
    
#ex1 break
headlines = ["Local Bear Eaten by Man",
             "Legislature Announces New Laws",
             "Peasant Discovers Violence Inherent in System",
             "Cat Rescues Fireman Stuck in Tree",
             "Brave Knight Runs Away",
             "Papperbok Review: Totally Triffic"]

news_ticker = ""
cont =0
for phase in headlines:
    for letter in phase:
        if cont >=140:
            break
        else:
            news_ticker+=letter
            cont+=1
print(len(news_ticker))
