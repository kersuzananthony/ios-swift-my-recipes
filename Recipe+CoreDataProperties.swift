//
//  Recipe+CoreDataProperties.swift
//  my recipes
//
//  Created by Kersuzan on 31/10/2015.
//  Copyright © 2015 Kersuzan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipe {

    @NSManaged var title: String?
    @NSManaged var steps: String?
    @NSManaged var ingredients: String?
    @NSManaged var picture: NSData?

}
