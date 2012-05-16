EventSorter
===========

Objective C side project I'm working on with a team of four people.  
A data tier/logic tier architect, a designer, a project manager, and my self on presentation in iOS/Cocoa.

-/PCPartynaut/PCAppDelegate.h, .m
This file sets up the application, pointing to the appropriate ViewController, setting up the managed object context
and initilizing the data object.

-/PCPartynaut/PCData.h, .m
This object gets json from our service and parses it using TouchJSON, sending the data to a SQlite database using CoreData.
Eventually it will check the service for updates and update the database asynchronously.

-/PCPartynaut/PCEventSorter.h, .m
Using predicates, this object sorts the events database by tag ID, of which each event can have many.  
Eventually there will be other sorters such as date range.

-/PCPartynaut/PCMap.h, .m
PCMap extends PCEventSorter.  It uses the results to populate a map with the visible points.

-/PCPartynaut/PCMasterViewController.h, .m, .xib
The actual view which contains the map.  The PCMap object is initilized here and buttons toggle individual tags' 
visibility.

-/PCPartynaut/Type, Event: ManagedObjects
Managed Objects corresponding to the SQLite entities.

