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
    
    init(modelName: String) { //data model file
        persistenceContainer = NSPersistentContainer(name: modelName)
    }
    
  //2.created persistence container. use it to load the persistence store
    func load(completion: (() -> Void)? = nil ){
        persistenceContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
        }
    }
    
}
