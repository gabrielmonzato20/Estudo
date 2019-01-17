li =['a','b','a','b','a','a']
dic = {}
# for world in li:
#     # if world in dic:
#     #     dic[world]+=1
#     # else:
#     #     dic[world]=1
#     dic[world] = dic.get(world, 0)+1
# print(dic)
# 17
cast = {
           "Jerry Seinfeld": "Jerry Seinfeld",
           "Julia Louis-Dreyfus": "Elaine Benes",
           "Jason Alexander": "George Costanza",
           "Michael Richards": "Cosmo Kramer"
       }
for key ,value in cast.items():
    print("{}----{}".format(key,value))