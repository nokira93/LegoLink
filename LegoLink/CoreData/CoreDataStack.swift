//
//  CoreDataStack.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 23/07/2023.
//

import CoreData

class CoreDataStack {
//    private let modelName: String
    
    let shared: CoreDataStack = CoreDataStack()
//    private init(modelName: String) {
//        self.modelName = modelName
//    }
    
    private init() {
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer()
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext

    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    func createModel() -> LegoSet {
        LegoSet(context: persistentContainer.viewContext)
    }
}
