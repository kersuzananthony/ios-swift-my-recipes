//
//  AddRecipeVC.swift
//  my recipes
//
//  Created by Kersuzan on 31/10/2015.
//  Copyright © 2015 Kersuzan. All rights reserved.
//

import UIKit
import CoreData

class AddRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var addImageBtn: UIButton!
    @IBOutlet weak var pictureImg: UIImageView!
    @IBOutlet weak var recipeTitleLbl: UITextField!
    @IBOutlet weak var recipeStepsLbl: UITextField!
    @IBOutlet weak var recipesIngredientsLbl: UITextField!
    
    var imagePickerController: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerController = UIImagePickerController()
        self.imagePickerController.delegate = self
        
        // Add a button on the navigation bar
        let barButton = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self, action: "saveRecipe:")
        self.navigationItem.rightBarButtonItem = barButton
        
        self.pictureImg.layer.cornerRadius = 20.0
        self.pictureImg.clipsToBounds = true
        
        // set title of button
        self.addImageBtn.setTitle("Add Picture", forState: UIControlState.Normal)

    }
    
    func saveRecipe(sender: UIBarButtonItem!) {
        if let title = recipeTitleLbl.text where title != "", let steps = recipeStepsLbl.text where steps != "", let ingredients = recipesIngredientsLbl.text where ingredients != "", let picture = pictureImg.image {
            // Grab the applicationDelegate
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)
            let newRecipe = Recipe(entity: entity!, insertIntoManagedObjectContext: context)
            newRecipe.title = title
            newRecipe.steps = steps
            newRecipe.ingredients = ingredients
            newRecipe.setRecipeImg(picture)
            
            // In manageObjectContext memory but not persisted yet
            context.insertObject(newRecipe)
            
            // Try to save the object 
            do {
                try context.save()
            } catch let err as NSError {
                print(err.debugDescription)
            }
            
            // Go back
            self.navigationController?.popViewControllerAnimated(true)
            
        } else {
            let alert = UIAlertController(title: "Recipe can be created", message: "Please complete all the fields before submitting the form", preferredStyle: UIAlertControllerStyle.Alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            
            alert.addAction(cancelAction)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
    }

    @IBAction func addPicturePressed(sender: UIButton!) {
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        // Hide the text of button
        self.addImageBtn.setTitle("", forState: UIControlState.Normal)
        
        self.addImageBtn.setTitle("", forState: UIControlState.Normal)
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.pictureImg.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
        UIImageWriteToSavedPhotosAlbum(image, nil, "finish", nil)
    }
    
    func finish() {
        print("saved")
    }
    
}
