//
//  Recipe.swift
//  my recipes
//
//  Created by Kersuzan on 31/10/2015.
//  Copyright © 2015 Kersuzan. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func getRecipeImg() -> UIImage? {
        if let image = UIImage(data: self.picture!) {
            return image
        }
        return nil
    }
    
    // Transform the image into data
    func setRecipeImg(image: UIImage) {
        self.picture = UIImagePNGRepresentation(image)
    }
    

}
