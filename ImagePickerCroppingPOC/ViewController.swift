//
//  ViewController.swift
//  ImagePickerCroppingPOC
//
//  Created by Kordel France on 5/27/16.
//  Copyright © 2016 Kade France. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    var photoSelected: Bool!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cameraButton.layer.cornerRadius = cameraButton.bounds.size.width / 4
        self.view.addSubview(photo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        if let chosenImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            photoSelected = true
            photo.image = chosenImage
        }

//        photo.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cameraLibrary(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        picker.allowsEditing = true
        presentViewController(picker, animated: true, completion: nil)
    }
    

}

