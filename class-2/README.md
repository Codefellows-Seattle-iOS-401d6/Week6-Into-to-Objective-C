#Week 6 - Class 2
##Homework
* Create a simple AddressBook app. Make sure to disable ARC.
* Write your own userDefaults that uses JSON format. Make it a Singleton.
* Manage your memory, create proper setters that retain/copy data when assigned(Dont use @property)

###Reading Assignment:
* Programming in Objective-C
  * **Chapter 16:** Working with Files
  * **Chapter 17:** Memory Management and Automatic Reference Counting

##Other Resources
* [Reading Assignments](../../Resources/ra-grading-standard/)
* [Grading Rubrics](../../Resources/)
* [Lecture Resources](lecture/)
* [Lecture Slides](https://www.icloud.com/keynote/000m0shf3CzsBXOPgyE5yadjw#Week6_Day2)

API - FRAMEWORK - SDK

FRAMEWORK:  a collection of classes, methods, functions, and documentation logically grouped together to make developing easier.

API:  talking to a server, they want to discuss using Facebook, Github, Twitter, Foursquare, City of Seattle Offleash.

SDK:  Software Development Kit.  

Numbers, Strings!

Number OBjects!
Ints, floats, longs = primitive data types.  not objects.

NSNumber class must be used to create number objects from data types.  Creates NSObjects

NSNumber *number = [NSNumber numberWithDouble: 3323626.3];
NSLog(@"%i", number.intValue);

isEqualToNumber: method to numberically compare two NSNumber objects.

Compare: method testss whether one numeric value is less <, >, =

CANNOT CHANGE VLAUE OF PREVIOUSLY CREATED NSNUMBER object
NSNumber is immutable object, but mutable pointer.

*number = @2; ---shorthand notation for creating a NSNumber Int  object
NSString *string = @"Programming is fun";

Interpolation is achieved with method: stringWithFormat:

Object cannot change..immutable.

Mutable classes inherit from immutable classes.  References can be changed.

Foundation array:  ordered collection of objects.  Most often, elements in an array are one particular type, but not required.

Obj. C arrays can be replicated in Swift array that contain any object.

Dictionary is a collection of dat consisting of key-ibject pairs.  Keys can be any object type but needs to be hashable.

Value associated with key can also be of any object type, but not nil.

Dictionaries can be muteable or immuteable.

FOUNDATION FRAMEWORK ENABLES YOU TO GET NSFILEMANAGER

NSFILEMANAGER:
create new file.
read from existing file.
write data to a file.
rename a file.
remove a file.
test for existience of a file.determien the sizeof file as well as other attributes Make a copy
test two files to see whether contentes are equal.

MBUserDefaults
NSUSERDEFAULTS IS A SINGLETON!
1:  do we want it to be a singleton or not?
Yes.
MBUserDefaults will be an object singleton.

2: what database do we want to use?
NSUSERDEFAULTS uses dictionary.
MBUserDefaults will be a dictionary.

3: we need to set database and get data... we must write mechanism to retrieve data.

MEMORY MANAGEMENT!

ARC!

Memory management is about cleaning up unused memory so it can be reused.  

Manual reference counting and autorelease protocool

Automatic reference counting (ARC)

MRC.
When an object is created, its initial reference count is set to 1.  Each time you need to ensure that the ojcet be kept around, you effectively create a reference to it by incrementing its reference by 1.  Done by sending message: [person retain];

When you nlo longer need it (decrement)
[person release];

When ref count reaches 0, teh system knows its not being used and deallocates.

Successful operationonf MRC strategy requires diligence to ensure that ref counts are approipately incremeneted and decremented during program execution to avoid memory leaks.

Some methods in Foundation might increment the reference count of an object, such as NSMutableArray's addOBject: method.

Likewise, methods have decrement ref count too removeOBjectAtindex:

autoreleasepool!

ARC, MRC, autoreleasepool

NSAutoreleasePool class was created in order to track objects to be released at a later time in an object known as autorelease pool.  That later time is when the pool gets drained, which is done by sending the autorelease pool object a drain message.

Objet created by a method whose name starts with the word alloc, copy, mutableCopy, or new is one that is not autoreleased.  In such a case, you own that object.
You're responsible for realeasing those objects.


HOW TO TURN OFF ARC.

Go to BUILD SETTINGS

ALL, not Basic

Search Automatic Reference Counting
Turn off!

Think of an event as something that typically occurs by your performing some action (for example, you press a button on iPhone) or by an implicit action (something arrives over network)

To process the new event, the system creats a new autorelease pool and might call some method in your application to process it.

When you're done handling the event, the system drains the autorelease pool.  That means any autoreleased objects you have created in proessing will be destroyed unless you have retained those objects so they will survive draining.

COPY OBJECTS!

##INTERVIEW QUESTION
What happens when you create a weak reference with ARC?
It doesn't increment/decremetn retain count because only strong references increment/decrement.  The weak reference will not increment retain, that's what makes it weak.

shallow copying - default behavior, only refs are copied not actual objects.
deep copying - making copies of the contents of each object in the array, not just copies of the references to the objects.  Implement your own mutableCopy, conform <NSCopying>.

- (id)copyWithZone:(NSZone *)zone (zone deals with memory)
{
	Person *person = [[Person alloc]init]; //this all returns a deep copy.
	person.name = self.name;
	person.email = self.email;

	return person;
}
