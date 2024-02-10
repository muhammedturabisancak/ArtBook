//
//  DetailsVC.swift
//  ArtBook
//
//  Created by Muhammed Turabi Sancak on 10.02.2024.
//

import UIKit
import CoreData

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameText: UITextField!
  @IBOutlet weak var artistText: UITextField!
  @IBOutlet weak var yearText: UITextField!
  
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
      
      
    //Recognizers
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    view.addGestureRecognizer(gestureRecognizer)
      
    imageView.isUserInteractionEnabled = true
      let imageTapReconizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
    imageView.addGestureRecognizer(imageTapReconizer)
      
      
      
      
    }
    
  
  
  
  
  
  @objc func selectImage(){
    let picker = UIImagePickerController()
    picker.delegate = self
    picker.sourceType = .photoLibrary
    picker.allowsEditing = true
    present(picker,animated: true,completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    imageView.image = info[.originalImage] as? UIImage
    self.dismiss(animated: true,completion: nil)
  }
  
  

  
  @objc func hideKeyboard()
  {
    view.endEditing(true)
  }
  
  
  @IBAction func saveButtonClicked(_ sender: Any) {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    
    let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
    
    newPainting.setValue(nameText.text!, forKey: "name")
    newPainting.setValue(artistText.text!, forKey: "artist")
    
    if let year = Int(yearText.text!){
      newPainting.setValue(year, forKey: "year")
    }
    
    newPainting.setValue(UUID(), forKey: "id")
    
    let data = imageView.image?.jpegData(compressionQuality: 0.5)
    
    newPainting.setValue(data, forKey: "image")
    
    do{
      try context.save()
      print("success")
    }catch{
      print("error")
    }
    
    
    
    
    
  }
  
}
