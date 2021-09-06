//
//  DataController.swift
//  Mooskine
//
//  Created by Nihal Erdal on 7/15/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import Foundation
import CoreData


//1.creating persistent container
class DataController{
    let persistenceContainer:NSPersistentContainer
    
    var viewContext: NSManagedObjectContext{ //3.convenient property to access to context. view context is associated w/ the main queue.
        return persistenceContainer.viewContext
    }
    
    
    var backgroundContext : NSManagedObjectContext!
    
    
    init(modelName: String) { //data model file
        persistenceContainer = NSPersistentContainer(name: modelName)
    }
    
    func configureContext(){
        backgroundContext = persistenceContainer.newBackgroundContext()
        
        viewContext.automaticallyMergesChangesFromParent = true //for foreground
        backgroundContext.automaticallyMergesChangesFromParent = true
        
        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump // in case of conflict, it'll prefer its own property values.
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump // in case of conflict, it'll prefer the property values from the persistenceStore
    }
    
  //2.created persistence container. use it to load the persistence store
    func load(completion: (() -> Void)? = nil ){
        persistenceContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            self.autoSaveViewContext(interval: 3)
            self.configureContext()
            completion?()
        }
    }
}

extension DataController {
    func autoSaveViewContext(interval: TimeInterval = 30){
        print("autosaving")
        guard interval > 0 else {
            print("cannot set negative autosave interval")
            return
        }
        if viewContext.hasChanges{
            try? viewContext.save()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval: interval)
        }
    }
}


