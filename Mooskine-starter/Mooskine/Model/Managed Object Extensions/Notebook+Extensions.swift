//
//  Notebook+Extensions.swift
//  Mooskine
//
//  Created by Nihal Erdal on 7/31/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import Foundation
import CoreData

extension Notebook{
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
