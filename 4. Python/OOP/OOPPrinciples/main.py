import customer as c
import employee as e
import random
# Create a customer object
# cust = c.Customer()
# cust.firstName = 'Jyoti'
# cust.lastName = 'Suresh'
# print(cust.lastName)

if random.randint(0,1) == 0:
    my_person = c.Customer('Jyoti','Suresh','Mumbai')
else:
    my_person = e.Employee('Minato', 'Fujiwara','Marketing')
my_person.print()

# OR SET AS PARAMETERs 
cust = c.Customer('Jyoti','Suresh','Mumbai')
cust.first_name = 'Rizmi'
cust.print()

emp = e.Employee('Minato', 'Fujiwara')
emp.print()

# Currently there is no control over access to the instance variables of 
# the Customer Class or Obejcts of the Class => Violation of ENCAPSULATION

# We'll use some conventions which indicate to other people 
# using our classes to indicate how we're expecting them to use the features we're providing
# adding _ to firstName & lastName => _firstName, _lastName
# if any feature of a class that begins with _ then you should regard that
# as private feature

