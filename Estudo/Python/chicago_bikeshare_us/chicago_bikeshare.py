
# coding: utf-8

# Here goes the imports
import csv
import matplotlib.pyplot as plt

# Let's read the data as a list
print("Reading the document...")
with open("chicago.csv", "r") as file_read:
    reader = csv.reader(file_read)
    data_list = list(reader)
print("Ok!")

# Let's check how many rows do we have
print("Number of rows:")
print(len(data_list))

# Printing the first row of data_list to check if it worked.
print("Row 0: ")
print(data_list[0])
# It's the data header, so we can identify the columns.

# Printing the second row of data_list, it should contain some data
print("Row 1: ")
print(data_list[1])

input("Press Enter to continue...")
# TASK 1
# TODO: Print the first 20 rows using a loop to identify the data.
print("\n\nTASK 1: Printing the first 20 samples")

# Let's change the data_list to remove the header from it.
#loop for all data_list,witchout the header and print the row ,21 is because python just python dont accep de currecy number 21
for data in data_list[1:21]:
    print(f"--{data}")

# We can access the features through index
# E.g. sample[6] to print gender or sample[-2]

input("Press Enter to continue...")
# TASK 2
# TODO: Print the `gender` of the first 20 rows

print("\nTASK 2: Printing the genders of the first 20 samples")
#make a for in range of 20 and print the number of row and the data,+1 is to dont accep the header and -2 is to take the gender column
for index in range(20):
    if data_list[index+1][-2] != "":
        print(f"{index+1}-{data_list[index+1][-2]}")
    else:
        print(f"{index+1}-None")


# Cool! We can get the rows(samples) iterating with a for and the columns(features) by index.
# But it's still hard to get a column in a list. Example: List with all genders

input("Press Enter to continue...")
# TASK 3
# TODO: Create a function to add the columns(features) of a list in another list in the same order
def column_to_list(data, index):
    """Trasform a column in a List
    Args:
    data :whole dataset
    index : the position of a column
    Return:
    a list with all data columns,less the headerself."""
    column_list = []
    #loop to take each row as datas  in dataset
    for datas in data[1:]:
        #append the datas columns in column list
        column_list.append(datas[index])
    # Tip: You can use a for to iterate over the samples, get the feature by index and append into a list
    return column_list


# Let's check with the genders if it's working (only the first 20)
print("\nTASK 3: Printing the list of genders of the first 20 samples")
print(column_to_list(data_list, -2)[:20])

# ------------ DO NOT CHANGE ANY CODE HERE ------------
assert type(column_to_list(data_list, -2)) is list, "TASK 3: Wrong type returned. It should return a list."
assert len(column_to_list(data_list, -2)) == 1551505, "TASK 3: Wrong lenght returned."
assert column_to_list(data_list, -2)[0] == "" and column_to_list(data_list, -2)[1] == "Male", "TASK 3: The list doesn't match."
# -----------------------------------------------------

input("Press Enter to continue...")
# Now we know how to access the features, let's count how many Males and Females the dataset have
# TASK 4
# TODO: Count each gender. You should not use a function to do that.
male = 0
female = 0
# iterate all data of column of index -2,genders
for data in column_to_list(data_list,-2):
    #if data is igual to male so male is igual a itself plus 1
    if data == "Male":
        male+=1
    # #if data is igual to famale so famale is igual a itself plus 1
    elif data == "Female":
            female+=1


# Checking the result
print("\nTASK 4: Printing how many males and females we found")
print("Male: ", male, "\nFemale: ", female)

# ------------ DO NOT CHANGE ANY CODE HERE ------------
assert male == 935854 and female == 298784, "TASK 4: Count doesn't match."
# -----------------------------------------------------

input("Press Enter to continue...")
# Why don't we creeate a function to do that?
# TASK 5
# TODO: Create a function to count the genders. Return a list
# Should return a list with [count_male, counf_female] (e.g., [10, 15] means 10 Males, 15 Females)
def count_gender(data_list):
    """this function count how many of each gender has in a dataset take just one parament:
        Args
        data_list: the whole dataset
        return:
        how many of each gender has in  data_set
    """
    male = 0
    female = 0
    for gender in column_to_list(data_list,-2):
           #if data is igual to male so male is igual a itself plus 1
           if gender == "Male":
               male+=1
                # #if data is igual to famale so famale is igual a itself plus 1
           elif gender == "Female":
                    female+=1



    return [male, female]


print("\nTASK 5: Printing result of count_gender")
print(count_gender(data_list))

# ------------ DO NOT CHANGE ANY CODE HERE ------------
assert type(count_gender(data_list)) is list, "TASK 5: Wrong type returned. It should return a list."
assert len(count_gender(data_list)) == 2, "TASK 5: Wrong lenght returned."
assert count_gender(data_list)[0] == 935854 and count_gender(data_list)[1] == 298784, "TASK 5: Returning wrong result!"
# -----------------------------------------------------

input("Press Enter to continue...")
# Now we can count the users, which gender use it the most?
# TASK 6
# TODO: Create a function to get the most popular gender and print the gender as string.
# We expect to see "Male", "Female" or "Equal" as answer.
def most_popular_gender(data_list):
    """this function return the most popular gender
    it take one parament ,the dataset, nd use oder function make in last exercese """""
    data = count_gender(data_list)
    if data[0] >data[1]:
        answer = "Male"
    elif data[0]< data[1]:
        answer = "Famele"
    else:
        answer = "Equal"
    return answer


print("\nTASK 6: Which one is the most popular gender?")
print("Most popular gender is: ", most_popular_gender(data_list))

# ------------ DO NOT CHANGE ANY CODE HERE ------------
assert type(most_popular_gender(data_list)) is str, "TASK 6: Wrong type returned. It should return a string."
assert most_popular_gender(data_list) == "Male", "TASK 6: Returning wrong result!"
# -----------------------------------------------------
# function to take quantity and types
def count_items(column_list):
    """
    function that see what kind of types has in a list and count how many times it s appear in a List
    Args:
    column_list : the dataset(list)
    Return
    the items types and how many times it s appear in a list
    """
    #https://stackoverflow.com/questions/2600191/how-can-i-count-the-occurrences-of-a-list-item
    from collections import Counter
    item_types = set(column_list)
    item_types = list(item_types)
    count_items = Counter(column_list)
    count_items = [ x for x in count_items.values()]
    return item_types, count_items

# If it's everything running as expected, check this graph!
gender_list = column_to_list(data_list, -2)
types =quantity= count_items(gender_list)
y_pos = list(range(len(types)))
plt.bar(y_pos, quantity)
plt.ylabel('Quantity')
plt.xlabel('Gender')
plt.xticks(y_pos, types)
plt.title('Quantity by Gender')
plt.show(block=True)

input("Press Enter to continue...")
# TASK 7
# TODO: Plot a similar graph for user_types. Make sure the legend is correct.
def count_types(data_list):
    """this function count how many of each gender has in a dataset take just one parament:
    data_list -- the dataset"""
    sub = 0
    cos = 0
    for c in data_list:
           #if data is igual to male so male is igual a itself plus 1
           if c == "Subscriber":
               sub+=1
                # #if data is igual to famale so famale is igual a itself plus 1
           elif c == "Customer":
                    cos+=1
    return [sub, cos]
print("\nTASK 7: Check the chart!")
user_types = column_to_list(data_list,5)
types = quant = count_items(user_types)
y_pos = list(range(len(types)))
plt.bar(y_pos, quant)
plt.ylabel('Quantity')
plt.xlabel('Types of user')
plt.xticks(y_pos, types)
plt.title('Quantity by type')
plt.show(block=True)



input("Press Enter to continue...")
# TASK 8
# TODO: Answer the following question
male, female = count_gender(data_list)
print("\nTASK 8: Why the following condition is False?")
print("male + female == len(data_list):", male + female == len(data_list))
answer = "The codition is false because the length of data_list count the header and count_gender dont count the header and in dataset has some rows that dont have genter and male+famale dont count this."
print("Answer:", answer)

# ------------ DO NOT CHANGE ANY CODE HERE ------------
assert answer != "Type your answer here.", "TASK 8: Write your own answer!"
# -----------------------------------------------------

input("Press Enter to continue...")
# Let's work with the trip_duration now. We cant get some values from it.
# TASK 9
# TODO: Find the Minimum, Maximum, Mean and Median trip duration.
# You should not use ready functions to do that, like max() or min().
trip_duration_list = column_to_list(data_list, 2)
# we declade that min and max is igual to trip list 0 its
min_trip =max_trip = trip_duration_list[0]
print(trip_duration_list[0])
mean_trip = 0
median_trip = 0

# fist we loop for all datas in a List
for data in trip_duration_list:
    # we declade that min and max is igual to trip list 0 its
    # the code above see if the data is less then date if is ,this s te min values
    if int(data) < int(min_trip):
        min_trip = int(data)
    # the code above see if the data is less then date if is ,this s te min values
    if int(data) >int(max_trip):
        max_trip = int(data)
    mean_trip+=int(data)

mean_trip = mean_trip/len(trip_duration_list)
#take a sort list
order_list=sorted([float(i) for i in trip_duration_list])
# take the length for the index
length= len(trip_duration_list)

index = (length-1)//2

if length %2:
     median_trip = order_list[index]
else:
    median_trip = int(order_list[index] + order_list[index+1])/2
#https://stackoverflow.com/questions/24101524/finding-median-of-list-in-python
print("\nTASK 9: Printing the min, max, mean and median")
print("Min: ", min_trip, "Max: ", max_trip, "Mean: ", mean_trip, "Median: ", median_trip)

# ------------ DO NOT CHANGE ANY CODE HERE ------------
assert round(min_trip) == 60, "TASK 9: min_trip with wrong result!"
assert round(max_trip) == 86338, "TASK 9: max_trip with wrong result!"
assert round(mean_trip) == 940, "TASK 9: mean_trip with wrong result!"
assert round(median_trip) == 670, "TASK 9: median_trip with wrong result!"
# -----------------------------------------------------

input("Press Enter to continue...")
# TASK 10
# Gender is easy because usually only have a few options. How about start_stations? How many options does it have?
# TODO: Check types how many start_stations do we have using set()
user_types = set(column_to_list(data_list,3))

print("\nTASK 10: Printing start stations:")
print(len(user_types))
print(user_types)

# ------------ DO NOT CHANGE ANY CODE HERE ------------
assert len(user_types) == 582, "TASK 10: Wrong len of start stations."
# -----------------------------------------------------

input("Press Enter to continue...")
# TASK 11
# Go back and make sure you documented your functions. Explain the input, output and what it do. Example:
# def new_function(param1: int, param2: str) -> list:
"""
      Example function with annotations.
      Args:
          param1: The first parameter.
          param2: The second parameter.
      Returns:
          List of X values
"""

input("Press Enter to continue...")
# TASK 12 - Challenge! (Optional)
# TODO: Create a function to count user types without hardcoding the types
# so we can use this function with a different kind of data.
print("Will you face it?")
answer = "yes"

def count_items(column_list):
    """
    function that see what kind of types has in a list and count how many times it s appear in a List
    Args:
    column_list : the dataset(list)
    Return
    the items types and how many times it s appear in a list
    """
    #https://stackoverflow.com/questions/2600191/how-can-i-count-the-occurrences-of-a-list-item
    from collections import Counter
    item_types = set(column_list)
    count_items = Counter(column_list)
    count_items = [ x for x in count_items.values()]
    return item_types, count_items


if answer == "yes":
    # ------------ DO NOT CHANGE ANY CODE HERE ------------
    column_list = column_to_list(data_list, -2)
    types, counts = count_items(column_list)
    print("\nTASK 11: Printing results for count_items()")
    print("Types:", types, "Counts:", counts)
    assert len(types) == 3, "TASK 11: There are 3 types of gender!"
    assert sum(counts) == 1551505, "TASK 11: Returning wrong result!"
    # -----------------------------------------------------