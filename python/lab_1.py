#task1
"""add your info in Variables then print them. 

firstname 
lastname 
email 
address 
intake
"""
from curses.ascii import isdigit


firstname="Rawan"
lastname="Elghali"
email="Rawanhamza8@gmail.com"
address="Mansoura"
intake=44
print(firstname)
print(lastname)
print(email)
print(address)
print(intake)

#task2
"""write a paragraph about yourself in 5 lines -make sure that the string is stored as a multiline string -"""
info_details= """My name is {firstname} {lastname}" 
my email is {email} 
my address is {address} 
my intake number is {intake}"""
print(info_details.format(firstname=firstname , lastname= lastname , email=email , address=address , intake=intake))

#task3
"""Given the total marks of a student→ write a program that prints the grade of a student as follows:
○Grade < 60 failed.
○Grade > 60 passed.
○Grade > 65 Good.
○Grade > 75  very good.
○Grade > 85 Excellent.
"""
user_input = input("Enter Your grade: ")
if user_input.isdigit():
    user_input=int(user_input)
    if user_input <60:
        print("Failed")
    elif user_input>=60 and user_input<=65:
        print("Passed")
    elif user_input>65 and user_input <=75:
        print("Good")
    elif user_input >75 and user_input <=85:
        print("Very Good")
    else:
        print("Excellent")
else:
    print("Invalid input")


#task4
""""4-Write a program that prints the weather state according to the temperature 
If the temperature > 25 then print “the weather is hot”
If the temperature < 25 print “the weather is cold”
If the temperature = 25 then print the “weather is fine”
"""
temp = input("Enter the temperature")
if temp.isdigit():
    temp=int(temp)
    if temp > 25 :
        print("The weather is hot")
    elif temp < 25 :
        print("The weaher is cold")
    else:
        print("weather is fine")
elif temp[0]=='-' :
    temp = temp.strip('-')
    if temp.isdigit():
        print("The weather is cold")
else:
    print("Enter a valid number")


#task5
"""5- write a program that checks if the number is 
greater than 0 and then prints positive else prints negative"""
user_num=input("Please enter the number")
if user_num.isdigit():
    print("Positive")
else:
    if user_num[0]=='-':
        user_num=user_num.strip('-')
        if user_num.isdigit():
            print("Negative")
    else:
        print("Enter a valid number")

#task6
"""print the types of variables you entered before"""
print("type of first name is " ,type(firstname) , "type of last name is "  ,type(lastname) ,
      "type of email is "  ,type(email) , "type of address is " ,type(address) , "type of intake is "  ,type(intake))

#task7
"""given 2 numbers 
	Num1 = 10 
	Num2  = 20
	Calculate the sum, diff, multiply, and division of the 2 numbers.
"""
num1=10
num2=20
print("sum = ", num1+num2 , "diff = " , num2-num1 , "multiply = :" , num1*num2,
    "division = " , num2/num1  )

#task8
"""ask the user to enter the name of the day 
If he entered Sunday then print(‘wish you a good week ’)
If he entered Tuesday then print(‘The weekend is near ’)
If he entered Friday then print(‘enjoy your weekend’)
If he entered other day print(‘ma3lsh’)
If entered not valid day —> please enter day again. 
"""
day = input("Enter the day: ")
day = day.lower()
if day =="sunday":
    print("wish you a good week")
elif day == "tuesday":
    print("The weekend is near")
elif day == "friday":
    print("enjoy your weekend")
elif day == "monday" or day == "wednesday" or day =="saturday" or day == "thursday":
    print("Ma3lsh")
else:
    print("please enter day again")

#task9
"""ask the user to enter his name then print ‘Nice to meet you  name’ use f-format string"""
user_name=input("Enter Your Name :")
message="Nice to meet you {user_name}"
print(message.format(user_name=user_name))

#task10
"""10- ask user to enter his firstname then ask him to enter midname then ask him to enter lastname
Then print fullname
"""
f_name=input("Enter Your First Name :")
m_name=input("Enter Your Middle Name :")
l_name=input("Enter Your Last Name :")
print(f_name ,m_name, l_name )

#task11
"""11- ask the user to enter his age and if he enters it correctly then multiply 
the age by 10 and print the result."""
age=input("Enter your age: ")
if age.isdigit():
    age=int(age)
    new_age=age*10
print(new_age)

#task12
"""12 -  ask the user to enter 2 numbers num1 and num2 make sure that he enter them as numbers and if all is ok
 print the multiplication them. """
number1= input("Enter the first number")
number2 =input("Enter the second number")
if number1.isdigit() and number2.isdigit():
    print(number1*number2) #the negative numbers 

#part 2
"""1 Ask the user to enter his name."""
username=input("Enter Your name ")
"""2 Count the number of letters in the name he entered."""
print(len(username))
"""3 Count the number of letters “o” in his name if exists and print the count."""
count_o=0
username=username.lower()
for char in username:
    if char.lower()=='o':
        count_o+=1
print(count_o)
"""4 Print the character at index 6 of the name if it exists if not,
 the print message says that there is no character at index 6"""
if len(username) > 6:
    print(username[6])
else:
    print("There is no letter at index 6.")

"""5 Ask the user to enter the radius of a circle"""
radius=input("please enter the radius of circle: ")
"""6 Calculate the circumference and the area of the circle."""
if radius.isdigit():
    radius=int(radius)
    cir=2*3.14*radius
    area=3.14*3.14*radius
    print("circumference is: ", cir ,"Area is: ", area)
else:
    print("please enter a valid number")

"""7 Ask the user to enter the length and the height of a rectangle and calculate
 the circumference and the area."""
rec_length=input("Please Enter the length: ")
rec_height=input("Please Enter the height: ")
if rec_length.isdigit() and rec_height.isdigit():
    rec_length=int(rec_length)
    rec_height=int(rec_height)
    rec_cir=(rec_height+rec_length)*2
    rec_area=rec_length*rec_height
    print("circumference is: ", rec_cir ,"Area is: ", rec_area)
else:
    print("please enter a valid number")
"""8 Ask the user to enter his first name, and last name and print the full name 
using format string and concatenation """
first_name=input("Please Enter Your first name: ")
last_name=input("Please Enter Your Last Name: ")
full_name="""Hello {first_name} {last_name}"""
print(full_name.format(first_name=first_name , last_name=last_name))
