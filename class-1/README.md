#Week 6 - Class 1
##Lab Assignment
* Create a category method on NSString that takes in itself and returns an array of words
* Write a method that takes in id type, checks if its NSNumber, NSString, NSArray and performs the following:
	* if number, calculate the square root
	* if string, reverses it
	* if array, checks for object type and calculates how many time specific type is mentioned (if array contains 3 strings, NSLog = contains 3 strings)
* Declare a simple protocol with optional and required methods. Name it whatever you like
* Declare a class called Person. Extend (indirectly - subclass) this class. Add appropriate behavior to your subclass (Person -> Employee)

###Reading Assignment:
* Programming in Objective-C
  * **Chapter 2:** Programming in Objective-C
  * **Chapter 3:** Objects, Classes, Methods
  * **Chapter 7:** More on Classes
	* **Chapter 15:** Numbers, Strings, and Collections

##Other Resources
* [Reading Assignments](../../Resources/ra-grading-standard/)
* [Grading Rubrics](../../Resources/)
* [Lecture Resources](lecture/)
* [Lecture Slides](https://www.icloud.com/keynote/000T-vKYDs7Yau3UJNHq2URgA#Week6_Day1)

An object is a thing.  Think about object oriented programming as a thing and something you want to do to that thing.

A unique occurrence of a class (Person) is an instance, and the actions that are perofmred on the instance are called methods.
Applying a method to an object can affect the state of that object.
Objects are unique representations from a class, and each object contains some info that is typically private to that object.  The methods provide the means of accessing and changing the data.

In this syntax, a name of a class or instance of that class is followe dby the method you want to perofmr.

When you ask a class or instance to perform some action, you say you're sending it a message.  The recippient of the message is the receiver.
What is sending a message? = performing a function on an object
Who is the receiver = the object instance you're calling the method on.

@interface section describes the class and its methods
@implementation section describes the data (the instance variables that objects from the class will store) and contains the actual code that implements the methods defined in the interface section.

if it's defined in the header file, it's public and can be accessed through other files (public by default)
.h file.

.m file
you'd copy the definition (properties and methods) and write actual implementation.  

.m is where you write the properties and methods.
.h is where you call them.

When a class is defined, you have to tell the objective c compiler where the class came from.  You hvae to name its parent class - NSObject

Every single class in objective c inherits from NSObject.

You need to fine methods and peroperties.

the leading - tells objective c that is a method.

When you declare a new method, you have to tell obcejtive c whether the method returns a velue (and if it does) what type of valueiit returns.

You do this by enclosing the return in () after the leading - or +

Each setter method ttakes an argument, which is indcated by () i n front of the argument.

The @implementation section contains the actual code for the methods you declared in the .m (@interface)

Create an instance:

Person *person = [[Person alloc]init];
object  pointer   mem allocation initialization
[person walk];
[person talk];

SETTERS / GETTERS

You can access your instanve variables in a clean way by writing special methods to set and retrieve their values called setters and getters.

Colelctively, setters and getters are also referred to as accessor methods.

The setters don't return a value because their () is to take an argumenta nd to set the corresponding instnace var to the var of that argument.

The purpose of getter is to g"get" the value of an instance var stored in an object and to send it back to the program.

Essentially, getters and setters are methods.

Person -> Name

NSString var = @"name"

person.name = var

ACCESSOR METHODS = another name for getters/setters

Getters don't return anything, they get.
Setters can return.
Both setters and getters will be generated automatcailly _'name' var will be used for backing name property.

Data Types & Expressions

in objective-c, any literal number, single char, or string is known as a constant.

58 = constnat int value

@"Programming is fun" = constant char string object

The id data type is used to store an object of any type.  It is a generic object type.  The id type is the basis for very important features in objective c known as olymorphism and dynamic binding.

 for in

 while do

 INHERITANCE!

 Soemtimes classes are created just to make ite asier for someon eto create a subclass, and these classes are called abstract classes or abstract superclasses.

 Foundation's NSNUmber class is an abstract class that was created for working with numbers as objects.  Spearate subclasses of NSNUmber exist for each numeric type.  Cause these subclases actually exist, unlike abstract superclasses, they are known as concrete subclasses.

 polymorphism - enables programs to be developed so objects from different classes can define methods that share the same name.

 The system always carries info about the class to which an object belongs.  This enables it to make these key decisions at runtime instead of at compile time.

 DYNAMIC TYPING!
 Defers the dtermination of the class that an object belongs to until the program is executing.

 id can be used for storing objects that belong to any class.

 Don' tget into the habit of overusing this generic class data type.  Use static typing - define a var to be an object from a particular class.

 isKindOfClass - is the object a member of class objector a descendant? (cares about inheritance)

 isMemberOfClass - is the obejct a member of class object? (doesn't ccare about inheritance)

 respondsToSelector - can instance of the specific class respond to selector?

 isSubclassOfClass - is the object a subclass of the specific class?

dynamic binding defers to determinatino of the actual method to invoke on an object until program execution time.

initialization
Common practice for all initialciers to begin with initialization
init invokes the parent initalizers first, executing the parents initializers ensures inherited instanve cars are properly initialized

You must assign the result of executing the parent's init method back to self because an initializer has the right to change the location fo the obejct in memory (reference will change)

THe process of initializing an object followed by setting it to some initial values is often combined into a single method.


If your class contains more than one initializer, one of them should be designated initailiezer, and all the other initializer methods should use it.

init is defined to return an instancetype type (instance of class)

init message is only sent once to each class, it is guaranteed to be sent before any other messages are sent to the class.  purpise is for you to perform any class initilization at that point.

GLOBAL, EXTERNAL, STATIC variables

global - outside any method, class, or function.  its value can be referenced anywhere in the module.

external - value can be accessed and changed by any other method or functions.  a var can be declared as extern in many places, but you can only define it once.  

static - not external.  file scope capable of setting and accessing variables.

ENUMERATED TYPES!

enum - flag {false, true};
immediately following the enum keywaord, it is followed by identifier that defines the permissible values.

To declare enum flag, you use num.

enum flag matchFound;

THe only values that can be assigned to this var are the names true and false.

Enumerated types:
fi you wantto have a specific integer value associated with ahn enum identifier, you can assign the itenger to the identifier when the data type is defined: nenum direction {up, down loeft, right};

Typedef statement.

Objective-C provides a capability taht enables the programmer to assign an alternative name to a data type.

This is done with a statement known as typedef.

The following statement defines the name Counter to be equivalent to the obejctive-c data type int: typedef int Counter;

typedef is very useful in case of Objective-C block declarations: typedef void(^StudentStoreCompletion)();

Categories & Protocols:
Categories are extensions in objective-C.

Categories are named.

Introduction!
Category can override another method in class, but this is considered poor practice.

You can have as may categories as you like, and if a method is defined in more than one category, there isn't assurance which one will be used.

Extending class by adding new methods with a category affects not just that, but all its subclasses as well.

Category named pairs must be uniqye.  Only on eNSString category named Utilities can be created.

inside viewcontroller+IDentifier.h

-(NSString *)idenfitifer
{
	return @"ViewController"; (in .m)
}

IN APPDELEGATE.M

IMPORT VIEWCONTROLLER.H

INSIDE BOOLAPPLICATION

ViewController *myVC = [[ViewCOntroller alloc]init];
NSString *identifier = [myVC identifier];


Protocol is a list of methods that is shared among classes.  The methods listed in the protcol do not have corresponding implementations and you cannot extend objective-C protocosl.

Swift protcools are required.
Objective C are optional or required.

If you implement all fo the required methods for a particular protocool, you are said to conform to or adopt that protocol.

You are allowed to define a protocol where all methods are optional, or one where all are required.

Compiler will crash if protocol methods aren't implemented.

Composite Objects

When you define a subclass, it inherits all instance vars and methods of the parent class.  In some cases, this is undesirable

A subclass is dependent on the parent class.  When you create a subclass, you must ensure that all the inherited methods work propertly because users of the class will have access to them.

As an alternative to subclassing, you an define a new class that contains as one of its oinstance vars an object from the lass you want to extend.  Then you have to define onyl thos emethods in the new class that are appropaite for that class.

PREPROCESSOR!

Part of objective C compilation process that recognizes special statemnts that can be interpsersed throughout a program.


As the name implies, the preprocessor actually processes these setatements before compile time.

#import - a way for preprocessor to look for specificed file on the systema nd copy the contents of the file into the program at the precise point at which the #import statement apperas?


@import is known as modules, supports the ability system header files to be prepreoessed more quickly (by precompiling them) and also avoids potential namespace conflicts.
