# SUBCLASS & SUPERCLASS
# Customer (subclass) of person(superclass) 
import customer as c

# OR SET AS PARAMETERs
class Person:
    def __init__(self, fname, lname):    # self refers to current object of the class
        self._first_name = fname 
        self._last_name = lname

    # DEFINING OTHER FUNCTION AS PART OF THE CLASS
    def print(self):
        print(f"Full name: {self._first_name} {self._last_name}")


    # using a DECORATOR - feature in pytohn which allows you to provide info about classes 
    # and how they're intended to be used
    @property
    def first_name(self):
        print('In get method')
        return self._firstName
    
    @first_name.setter
    def first_name(self,new_first_name):
        print('In set method')
        self._first_name = new_first_name