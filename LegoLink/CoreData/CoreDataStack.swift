//
//  CoreDataStack.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 23/07/2023.
//
import UIKit
import CoreData

//class CoreDataStack {
//
//    static let shared: CoreDataStack = CoreDataStack()
//
//    private init() {
//}
//
//    var persistentContainer: NSPersistentContainer = {
//        let storeURL = URL.storeURL(for: "group.LegoSetModel", databaseName: "DataModel")
//             let storeDescription = NSPersistentStoreDescription(url: storeURL)
//             let container = NSPersistentContainer(name: "DataModel")
//             container.persistentStoreDescriptions = [storeDescription]
//        container.loadPersistentStores(completionHandler: { storeDescription, error in
//            if let error = error as NSError? {
//                print(error)
//            }
//        })
//        return container
//    }()
//
//
//
//    private lazy var storeContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer()
//        container.loadPersistentStores { _, error in
//            if let error = error as NSError? {
//                print("Unresolved error \(error), \(error.userInfo)")
//            }
//        }
//        return container
//    }()
//
//    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
//
//    func saveContext() {
//        guard managedContext.hasChanges else { return }
//        do {
//            try managedContext.save()
//        } catch let error as NSError {
//            print("Unresolved error \(error), \(error.userInfo)")
//        }
//    }
//    func createModel() -> LegoSetModel {
//        LegoSetModel(context: persistentContainer.viewContext)
//    }
//
//    func getStoredDataFromCoreData() -> [LegoSetModel]? {
//            let managedContext = persistentContainer.viewContext
//
//            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LegoSetModel")
//            do {
//                return try managedContext.fetch(fetchRequest) as? [LegoSetModel]
//
//            } catch{
//                return nil
//
//            }
//        }
//}

class CoreDataStack {
    
    static let shared: CoreDataStack = CoreDataStack()
    
    private init() {}
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
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
    
//    func saveContext() {
//        let context = storeContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
    
    func createModel() -> LegoSetModel {
        LegoSetModel(context: storeContainer.viewContext)
    }
    
    func getStoredDataFromCoreData() -> [LegoSetModel]? {
        let managedContext = storeContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LegoSetModel")
        do {
            return try managedContext.fetch(fetchRequest) as? [LegoSetModel]
            
        } catch{
            return nil
            
        }
    }
}
