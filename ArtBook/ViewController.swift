//
//  ViewController.swift
//  ArtBook
//
//  Created by Muhammed Turabi Sancak on 10.02.2024.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var tableView: UITableView!
  
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
    
  }
  
  @objc func addButtonClicked(){
    performSegue(withIdentifier: "toDetailsVC", sender: nil)
  }


}

