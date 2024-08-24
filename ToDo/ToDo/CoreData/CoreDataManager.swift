//
//  CoreDataManager.swift
//  ToDo
//
//  Created by Khusrav Safiev on 8/24/24.
//

import Foundation
import CoreData


class CoreDataManager {
    static let shared = CoreDataManager()
    
    var persistenContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ModelToDo")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    
    }()
    
    var context: NSManagedObjectContext {
        return persistenContainer.viewContext
    }
    
    func safeContext() {
        let context = persistenContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
