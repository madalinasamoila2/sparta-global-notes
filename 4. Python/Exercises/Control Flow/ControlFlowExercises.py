print("\nQ1a\n")
# Q1a: Print only the first 5 numbers in this list
x = [2, 5, 4, 87, 34, 2, 1, 31, 103, 99]

# A1a:
print(x[:5])



print("\nQ1b\n")
# Q1b: Now print only the even numbers in this list (the elements that are themselves even)
x = [2, 5, 4, 87, 34, 2, 1, 31, 103, 99]

# A1b:
even_numbers = [num for num in x if num % 2 == 0]
print(even_numbers)

print("\nQ1c\n")
# Q1c: Now only print the even numbers up to the fifth element in the list (e.g. 2, 4, 34)
x = [2, 5, 4, 87, 34, 2, 1, 31, 103, 99]

# A1c:
for num in x[:5]:
    if num % 2 == 0:
        print(num)

# -------------------------------------------------------------------------------------- #

print("\nQ2a\n")
# Q2a: from the list of names, create another list that consists of only the first letters of each first name
# e.g. ["Alan Turing", "Leonardo Fibonacci"] -> ["A", "L"]
names = ["Alan Turing", "Leonardo Fibonacci", "Katherine Johnson", "Annie Easley", "Terence Tao"]

# A2a:
initial_list = []
for i in names:
    initial_list.append(i[0])
print(initial_list)



print("\nQ2b\n")
# Q2b: from the list of names, create another list that consists of only the index of the space in the string
# HINT: use your_string.index("substring")
names = ["Alan Turing", "Leonardo Fibonacci", "Katherine Johnson", "Annie Easley", "Terence Tao"]

# A2b:
space_indices = []
for name in names:
    space_index = name.index(" ")
    space_indices.append(space_index)
print(space_indices)




print("\nQ2c\n")
# Q2c: from the list of names, create another list that consists of the first and last initial of each individual
names = ["Alan Turing", "Leonardo Fibonacci", "Katherine Johnson", "Annie Easley", "Terence Tao"]

# A2c:
initials_list = []
for name in names:
    space_index = name.index(" ")
    first_initial = name[0]
    last_initial = name[space_index + 1]
    initials = first_initial + last_initial
    initials_list.append(initials)
print(initials_list)


# -------------------------------------------------------------------------------------- #

print("\nQ3a\n")
# Q3a: Here is a list of lists, print only the lists which have no duplicates
# Hint: This can be easily done by using sets as a set does not contain duplicates
list_of_lists = [[1,5,7,3,44,4,1],
                 ["A", "B", "C"],
                 ["Hi", "Hello", "Ciao", "By", "Goodbye", "Ciao"],
                 ["one", "Two", "Three", "Four"]]


# A3a:
for sublist in list_of_lists:
    if len(sublist) == len(set(sublist)):
        print(sublist)


# -------------------------------------------------------------------------------------- #

print("\nQ4a\n")
# Q4a: Using a while loop, ask the user to input a number greater than 100, if they enter anything else,
# get them to enter again (and repeat until the conditions are satisfied). Finally print the number that
# they entered

# A4a:
while True:
    input_number = input("Input a number greater than 100")
    number = int(input_number)
    if number > 100:
        print(f"Great! Number {number} is more than 100")
        break
    else:
        print(f"Try again, number {number} is not greater than 100")

print("\nQ4b\n")
# Q4b: Continue this code and print "prime" if the number is a prime number and "not prime" otherwise

# A4b:
from sympy import *

while True:
    input_number = input("Input a prime number greater than 100")
    number = int(input_number)
    if isprime(number):

        if number > 100:
            print(f"Great! Number {number} is more than 100 and prime!")
            break
        else:
            print(f"Try again, number {number} is not greater than 100")
    else: 
        print(f"Please enter a prime number. Number {number} you've entered is not prime.")
        




