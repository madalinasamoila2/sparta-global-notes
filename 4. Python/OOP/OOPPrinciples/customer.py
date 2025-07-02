import person as p
## Creating Customer Class, Object Self

# class Customer(p.Person):
#     def __init__(self):    # self refers to current object of the class
#         self.firstName = '' 
#         self.lastName = ''

class Customer(p.Person):
    def __innit__(self,fname, lname, address):
        self._address = address
        super().__innit(fname,lname)

        def print(self):
            print(f'Address: {self._address}',end='')
            super().print()

# # OR SET AS PARAMETERs
# class Customer(p.Person):
#     def __init__(self, fname, lname):    # self refers to current object of the class
#         self._firstName = fname 
#         self._lastName = lname

#     # DEFINING OTHER FUNCTION AS PART OF THE CLASS
#     def print(self):
#         print(f"Full name: {self._firstName} {self._lastName}")


#     # using a DECORATOR - feature in pytohn which allows you to provide info about classes 
#     # and how they're intended to be used
#     @property
#     def first_name(self):
#         print('In get method')
#         return self._firstName
    
#     @first_name.setter
#     def first_name(self,new_first_name):
#         print('In set method')
#         self._first_name = new_first_name