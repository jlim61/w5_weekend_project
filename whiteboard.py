# How to solve a problem:
    # Figure out what the input and its type are
    # Set up a function
    # Figure out what the output and its type are
    # Gather Your Knowledge
    # Gathers Your Constraints (Not always necessary) 
    # Determine a Logical way to solve the problem
        #Write each step out English
        #Write each step out in Python-esse (sudo-code)
    # Invoke and Test Your Function

'''
In this little assignment you are given a string of space separated numbers, and have to return the highest and lowest number.
Examples
high_and_low("1 2 3 4 5")  # return "5 1"
high_and_low("1 2 -3 4 5") # return "5 -3"
high_and_low("1 9 3 4 -5") # return "9 -5"
Notes
All numbers are valid , no need to validate them.
There will always be at least one number in the input string.
Output string must be two numbers separated by a single space, and highest number is first.
'''

test = "1 2 3 4 5"
test2 = "1 2 -3 4 5"
test3 = "1 9 3 4 -5"


def high_low(astring):
    astring_list = sorted(astring.split(), reverse = True)
    # print(astring_list, ' = astring converted to list and order reversed')
    return f"{astring_list[0]} {astring_list[-1]}"


print(high_low(test))
print(high_low(test2))
print(high_low(test3))