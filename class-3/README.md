#Week 6 - Class 3
##Homework
* Define and build out the model for our ClassMates app.
	* Define a Student class with these **VARIABLES**: firstName, lastName, email, phone.
		* They are private by default and require setters and getters.
	* Declare a custom initializer that takes in required parameters.
	* Conform Student class to NSCoding protocol and implement required methods.
* Define and build StudentStore.
	* Make this class a singleton that manages an array of students.

###Reading Assignment:
* Programming in Objective-C:
  * **Chapter 4:** Data Types and Expressions
  * **Chapter 5:** Program Looping

##Other Resources
* [Reading Assignments](../../Resources/ra-grading-standard/)
* [Grading Rubrics](../../Resources/)
* [Lecture Resources](lecture/)
* [Lecture Slides](https://www.icloud.com/keynote/0001oVy64JGT-gIOYJH5_BdRA#Week6_Day3)

Instruments allow you to view data from different aspects of the app and view them side by side, helping identify trends and bottle necks.

Trace document is what we're looking at when we're recording.  All data and work done inside instruments are trace documents.  Each document typically only hold a single session worth of data and is a single trace. Saveable.

There are few instruments that can even simulate user interface interactions.

TOOLS!
Allocations - captures and displaying info about memory allocations in app.  Allocations help identify what is going on i memory.

Leaks - leaks instrument measures your general memory usage, marks any leaked memory.

Zombies - instrument will help detect overreleased objects, aka zombiez, aka daling pointers.  It works by replacing any object that has its retain count set to 0 with a NSZombie object, then detects whenever these zombie objects are executed on.  Use with pre-arc code.

Time profiler - helps you provide a great user experience.  Use it anytime your app is acting choppy or sluggish and you don't know why.

Printing a stack trace - if execution is paused, like breakpoint, you can type bt in the console to print out a back trace.

Objective-C runtime!

About Objective-C
defers as many decisions as possible from compile and link time... to runtime.

This makes it very dynamic.

It doesn't just need a compiler, it also needs runtime system to execute compiled code.

Obj C library is written in C & Assembler.  It adds the object oriented capabilities to C, thereby giving us Obj C.

OBjective-C runtime is open source.
Objective-C is not.

Obj-C source doe - runtime system works automatically with Obj-C code you write then compile.

NSObject Methods - most objects in cocoa are subclasses of NSObject class so they inerhiet its method.  Many of the methods are directly designed to work with runtime (class, isMemberofclass, respondsToSelector)

RUntime functions - runtime is dynamic shared oepn source library.  You can freely modfiy it to your liking to develop systems and tools to augment the development experience.

Whenever you send a message in Obj-C [receiver message];

Compiler convers thsi msssage expresson into a call of function objc_msgSend.  This function takes the receiver and the name of the method mentioned in the message, aka the selector, as its two principle parameters: objc_msgSend(receiver, selector)

CLASS STRUCTURE!

Key to understanding how messageing works is by understanding the structure that compiler builds for each class and object.

Every class structure includes two essential elemnets: a pointer to the superclass; a class dispatch table.

Class dispatch table has entries that associate methods selectors with the class specific address of the methods they identiyf.

Every class has to have 2 classes at runtime:
POINTER AND DISPATCH TABLE.

Obj-c class keeps a referenceto its super class, and a list of impelmented methods
When a new object is created, memory for it is allocated, and its instance variables are intialized.

First among object variables is one very important element: apointer called "isa" the "isa" pointer is a pointer to an object's class structure.

Message is sent to an object, the messaging function objc_msgSend() follows the object's isa pointer to the class structure, where it looks up the method selector in the dispatch table.

If it can't find the method, objc_msgSend() follows the class structure's pointer to its super class and tries to find method again.

With each failure to find the method, objc_msgSend() climbs the class hierarchy until it reaches the NSObject class.

once the method is found, teh function calls the method in the table and passes it the receiving object data structure.


Dynamic binding - method implementations are chosen at runtime.
Methods are dynamically bound to messages.

objc_msgSend finds the method, calls the method, passes regular parameters (if has any).  Passes two hidden arguments: receiving object and message sent.

-(void)walk
{
	id target = self;
	SEL method = _cmd;
}

Class Cache

When the runtime follows an object's 'isa' pointer to its class, it can find many methods.  Often only a small handful of methods are actually called on a regular basis.

So the class implements a cache, whenever a method is called it puts into the cache.

This greatly increases the speed of objc_msgSend() because it means it usually own't have to search through the entire table of implemented methods.

Run loops are what actually make your code run.

Messaging mechanism respondible for scheduling work and coordinate the receipt of incoming events.

Think of it like a post box that waits for messages and deliveres them to recipients.

Wait until something happens.

Dispatch message to the receiver.

Run loop receives events from two types of sources: input sources, deliver asynchronsouly and messages from other threads or different application.  Timer sources deliver synchronus, occurin gat a scheduled time or repeating interval.

Run loop modes - collection of input sources and timers to be monitoried and a collection of run loop observers to be notified.

Each time you run your run loop, a particular mode is specificed to be run.

During that pass of the run loop, only sources associated with that run loop are monitored and allowed to deliver events.
You can use modes to filter out any unwanted sources during particular passes
Most of the time your run loops will simply run in the system defined default mode.

Every thread has one run loop associated wiht it

OSX/iOS apps this is instsance of NSRunLoop

For lower level apps, use CFRunLoopRef

Run [NSRunLoop currentRunLoop] to get a ref to the run loop associated with the current thread your code is excuting on.

Only time you need to work with run loops is if you explicitly create secondary thredads for application.

Pretty rare because of GCD and OeprationQueues

NSThreads automatically create a run loop when the thread itself is created, so you wouldn't need to create the run loop yourself.

It's just good to know generally what a run loop is and what it does.

Messaging NIL!

If you are calling on nil object returns an object, the method returns nil.

If the method yo are calling on the nil object returns number,  the method returns 0

If the method you're calling on the nil object returns a struct, the method treturns  astruct with all fields set to 0.

if method returns anything eles, return value is undefined.
