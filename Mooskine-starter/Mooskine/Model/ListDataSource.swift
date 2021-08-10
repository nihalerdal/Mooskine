////
////  ListDataSource.swift
////  Mooskine
////
////  Created by Nihal Erdal on 8/7/21.
////  Copyright © 2021 Udacity. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//
//class ListDataSource<ObjectType: NSManagedObject, CellType: UITableViewCell>: NSObject, UITableViewDataSource, NSFetchedResultsControllerDelegate {
//
//    var fetchedResultsController: NSFetchedResultsController<ObjectType>
//
//    var reuseCell : String
//
//    init(tableView: UITableView, managedObjectContext: NSManagedObjectContext, fetchRequest: NSFetchRequest<ObjectType>, reuseCell: String, configure: @escaping (CellType, ObjectType) -> Void) {
//
//        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
//
//        try? fetchedResultsController.performFetch()
//    }
//
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let aCell = fetchedResultsController.object(at: indexPath)
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath)
//    }
//
//    //
//}
