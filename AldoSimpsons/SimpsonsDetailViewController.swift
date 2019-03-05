//
//  SimpsonsDetailViewController.swift
//  
//
//  Created by MAC Consultant on 03/01/19.
//  Copyright © 2019 Aldo. All rights reserved
//

import UIKit

class SimpsonsDetailViewController: UIViewController {
    
    var simpson : Simpsons?
    var imageLabel: UIImage!
    var nameLabel: String!
    var bioLabel: String!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var characterNameLbl: UILabel!
    
    @IBOutlet weak var characterBioLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupUI()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
    func setupUI() {
        characterNameLbl.text = nameLabel
        characterBioLbl.text = bioLabel
        imageView.image = imageLabel
    }
    
    @IBAction func addToFavorites(_ sender: UIButton) {
        
    }

    @IBAction func dismissView(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
