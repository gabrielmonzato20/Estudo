# how_many_snakes = 1
# snake = """
# Welcome to Python3!
#
#              ____
#             / . .\\
#             \  ---<
#              \  /
#    __________/ /
# -=:___________/
#
# <3, Juno
#            _____
#           / *.* \
#           \   ------<
#            \    /
#   __________/  /
#   ____________/
# """
# print( snake * how_many_snakes)
# name = input("Enter wich a number: ")
# print("hello {}".format(name.title()))
# num = int(float("enter wich a nmber"))
# print( num)
student = input("Enter wich student separate by ,").split(",")
assignments= input("Enter wich assignments separate by ,").split(",")
grades =   input("Enter wich grades separate by ,").split(",")
for c in range(len(student)):
    print("""Hi {},

This is a reminder that you have {}
assignments left to submit before you can graduate. Your current grade is
 {} and can increase to {}
 if you submit all assignments before the due date."""
 .format(student[c],assignments[c],grades[c],float(grades[c])*(2*float(assignments[c]))))
