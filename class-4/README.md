#Week 6 - Class 4
##Homework
* Build the UI:
	* Embed the ViewController into the NavigationController.
	* Create a new viewController called AddViewController. Define class method identifier:.
		* Add Student property to the AddViewController.
		* Setup AddViewController scene with text fields for each model variable. Add "Save" button.
	* Add UIBarButton to the ViewController & create a segue to the AddViewController.
	* Add a table view to the ViewController.
* Build the Backup Engine.
	* Create / add a function `studentsFromRecords:completion:` to Student+Addition
	* Create CouldBackupService.
	* Run tests in viewDidLoad: to set for all possible options such as creation, deletion of Student records.
	* Implement creation / deletion of student records into the UI.
	* Update StudentStore to include completions in add:, remove:, removeItIndexPath: methods.

###Reading Assignment:
* Cracking the coding Interview/Programming Interviews Exposed:
  * Binary Search Trees

##Other Resources
* [Reading Assignments](../../Resources/ra-grading-standard/)
* [Grading Rubrics](../../Resources/)
* [Lecture Resources](lecture/)
* [Lecture Slides](https://www.icloud.com/keynote/0001fv5Yc5QYUMGr2wWLbIFUQ#Week6_Day4)

Mission: integrate CloudKit
SERVER IS ALWAYS RIGHT.
SERVER FIRST.

1.CloudKit Setup
2.CloudService setup: retrieve, add, delete.
3.Update add functionality to Store. (add now takes a completion)
4.Extend student class to convert CKRecords to students.
5.Update viewcontrollers.
6. call cloudkit from app delegate.

TOPICS!

RETAIN CYCLES! - strong references to each other.

weak reference:
non owning relationship where the source does not retain the object which is has reference.
Coacoa conventions dictate parent objects should have strong references to children, children ahve weak refs to parents

Examples of weak/ssign references in cocoa: data sources, delegates, notofication boservers

That's why yspecifically unregister for notifications when your object is about to be releaed, since the notification center only keeps assign references to objets who sign p for notifications.  If you don't unregister, notofication center may try to deliver notification to released object. CRASAH.

Whenever you can, use weak.  Weak properties autmaticallys et to nil when object is set ton il.

When referreing to self inside a block (or closure) pbest practice is to create a weak reference in self before block and use the refence instead of self.

Since blocks and closures capture trong references to all objects accessed in their bodies, if the object represented by self were to get a strong pointer to the block or closure, then we would have retain cycle.

__weak typeof(self)weakSelf = self;

[context performBlock:^{
	__strong typeof(weakSelf)strongSelf = weakSelf;
	//do stuff

	NSError *error;

	[strongSelf.context save:&error];
	//do stuff
	}];

MULTIPLE STORYBOARDS!

When you are building an app with storyboard, sometimes you want lots of storyboards.

Add new storyboard file.
Give storyboard a name that describes it.
Inc ode, when you need to transition to a VC in another storyboard, use UIStoryboard's storyboardWithName:bundle: method to get a reference to storyboard.

Use instantiateViewControllerWithIdentifier: on storyboard to get ar eference to first VC you want to show from that storyboard.

Remove Main.storyboard references in Xcode project settings.

Create multiple storyboard files with desriptive names.

Programmatically set and isntance of TabBarController as the rootViewCOntroller onw indow in App delegate
Set tabBarController viewControllers property to main view controlelrs from each storyboard.

KEY VALUE CODING!

NSKEYVALUECODING
Protocol taht defines mechamism for indrectlya ccessing object properties.

Object properties are accessed using the property name rather than directly using the accessor method.
Object properties can be accessed in a consistent manner.
Dynamic and flexible piece of Foundation architecutre
NSOBject conforms to this protcol so your subclasses of NSOBject get KVC for free.

PROTOCOL METHOD!

KVO! another protocol.  considered informal.  

Object properties can be observed indrectly by their key.

One object can observe the property of another object, taking action any time the property value changes.

Closely related with the last topic, KVC.

Is available in Swift.

KVO workflow!

Object you want to observe must be KVO compliant.

Object that will be doing the observing will be set to the observer by calling addObserver:forKeyPath:options:context on the object you want to bserve.

observeValueForKeyPAth:ofObject:change:context needs to be implemented by the observing class.

Last 2 parameters for step 2 are interesting: typically you pass in 0 and NULL.

When peroperties are set, using generated setter, these methods are called before and after the change occurs.

if you mutate properites outside of the generated setter, you'll need to call these methods manually to be KVO compliant.

-(void)willChangeValueForKey:(NSString *)key;
-(void)didChangeValueForKey:(NSString *)key;

New - makes it so the change dictionary contains the new value if applicable

Old - same but for the old value.

CONTEXT!

static void *(MyContext = &MyContext;

	You can pass contexts in when you register to observe and then do some conditional checking on the context when the observation callback is triggered)

KVO gotchas.
Remember to remove observers (use dealloc)
