print("\nQ1a\n")
# Q1a: Write a function which takes in an integer as an argument and returns the divisors of that number as a list
# e.g. f(12) = [1, 2, 3, 4, 6, 12]
# hint: range(1, n) returns a collection of the numbers from 1 to n-1

# A1a:
def divisors(n):
    divisor_list = []
    for i in range(1,n+1):
        if n % i == 0:
            divisor_list.append(i)
    print(divisor_list)

divisors(12)




print("\nQ1b\n")
# Q1b: Write a function which takes in two integers as arguments and returns true if one of the numbers
# is a factor of the other, false otherwise
# (bonus points if you call your previous function within this function

# A1b:
def divisors(n):
    divisor_list = []
    for i in range(1,n+1):
        if n % i == 0:
            divisor_list.append(i)
    return divisor_list

def is_factor(num1,num2):
    if num1 in divisors(num2) or num2 in divisors(num1):
        return True
    return False

print(is_factor(5,12))


# -------------------------------------------------------------------------------------- #

print("\nQ2a\n")
# Q2a: write a function which takes a letter (as a string) as an input and outputs it's position in the alphabet
# alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
#             "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

# A2a:
def letter_position(x):
    alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", 
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    return alphabet.index(x) 
    

print(letter_position("a"))
print(letter_position("c"))
    


print("\nQ2b\n")
# Q2b: create a function which takes a persons name as an input string and returns an
# ID number consisting of the positions of each letter in the name
# e.g. f("bob") = "1141" as "b" is in position 1 and "o" is in position 14

# A2b:
def generate_id(name):
    return ''.join([str(letter_position(i)) for i in name.lower()])

print(generate_id('bob'))


print("\nQ2c\n")
# Q2c: Create a function which turns this ID into a password. The function should subtract
# the sum of the numbers in the id that was generated from the whole number of the id.
# e.g. f("bob") -> 1134 (because bob's id was 1141 and 1+1+4+1 = 7 so 1141 - 7 = 1134)

# A2c:
def generate_password(name):

    id_string = generate_id(name)
    
    id_numbers = [int(digit) for digit in id_string]
    
    sum_digits = sum(id_numbers)
    password = int(id_string) - sum_digits

    print(password)

generate_password('bob')



# -------------------------------------------------------------------------------------- #

print("\nQ3a\n")
# Q3a: Write a function which takes an integer as an input, and returns true if the number is prime, false otherwise.

# A3a:
def isprime(n):
    if n <= 1:
        return False
    for i in range(2, int(n**0.5)+1):
        if n % i == 0:
            return False
    return True

print(isprime(10))


print("\nQ3b\n")
# Q3b: Now add some functionality to the function which does not error if the user inputs something other than a digit

# A3b:
def check_input_and_prime():
    user_input = input("Enter a number to check if it's prime: ")
    
    try:
        num = int(user_input)
        return isprime(num)
    except ValueError:
        return "Please enter a valid integer."
    



# -------------------------------------------------------------------------------------- #






