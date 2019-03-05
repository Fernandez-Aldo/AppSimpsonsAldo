//
//  SimpsonsCollectionViewController.swift
//  
//
//  Created by MAC Consultant on 03/01/19.
//  Copyright © 2019 Aldo. All rights reserved.
//

import UIKit



class SimpsonsCollectionViewController: UIViewController {

    let cellIdentifier = "SimpsonsCollectionViewCell"
    
    lazy var manager = JSONManager()
    var simpson = [Simpsons]()
    
   
    @IBOutlet weak var collectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadSimpson()
      
        self.collectionView!.dataSource = self as? UICollectionViewDataSource
        self.collectionView.delegate = (self as! UICollectionViewDelegate)
        

        let cellNib = UINib(nibName: "SimpsonsCollectionViewCell", bundle: nil)
        self.collectionView?.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }
    
    func downloadSimpson() {
        let completion = { [unowned self] (newSimpson: Simpsons) in
           
            DispatchQueue.main.async { [unowned self] in
                self.simpson.append(newSimpson)
                self.collectionView.reloadData()
            }
        }
        self.manager.downloadSimpsons(completion: completion)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }

  
    
    extension SimpsonsCollectionViewController:UICollectionViewDataSource {


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return simpson.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SimpsonsCollectionViewCell
    
        // Configure the cell

        let data = Data(referencing: self.simpson[indexPath.row].Icon!)
         cell.imageView.image = UIImage(data: data)
        
        return cell
    }

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let simpsonSelected = simpson[indexPath.item]
            print("Yo!")
            performSegue(withIdentifier: "DetailVC", sender: simpsonSelected)
        }
        
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "DetailVC" {

            if let character = sender as? Simpsons {
                
                
                let vc = segue.destination as! SimpsonsDetailViewController
                if let nameData = character.relatedTopics {
                    vc.nameLabel = nameData
                }
                if let bioData = character.relatedTopics {
                    vc.bioLabel = bioData
                }
                if let imageData = character.relatedTopics {
                    vc.imageLabel = UIImage(data: imageData as Data)
                }


}

extension SimpsonsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = self.collectionView.frame.size.width

        
        return CGSize(width: screenWidth/4.0,
                      height: screenWidth/4.0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
 }
}
}
}
}
