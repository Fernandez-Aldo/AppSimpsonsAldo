//
//  ViewController.swift
//  
//
//  Created by MAC Consultant on 03/01/19.
//  Copyright © 2019 Aldo. All rights reserved.
//

import UIKit

class SimpsonsTableViewController: UIViewController {
    lazy var manager = JSONManager()
    var simpson = [Simpsons]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
//        self.manager.downloadSimpsons()
        downloadSimpson()
        
    }
    func downloadSimpson() {
        let completion = { [unowned self] (newSimpson: Simpsons) in
            
            DispatchQueue.main.async { [unowned self] in
                self.simpson.append(newSimpson)
                self.tableView.reloadData()
                    print("did set image data")
            }
      
        }
        self.manager.downloadSimpsons(completion: completion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension SimpsonsTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
            cell.textLabel?.text = Simpsons[indexPath.row].name!
            cell.textLabel?.textColor = UIColor.yellow
            cell.textLabel?.font = UIFont(name: "Chalkboard SE", size: 15)
        return cell
    }
    
    
}

extension SimpsonsTableViewController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailVC" {
            print("First step accomplished!")
            let vc = segue.destination as! SimpsonsDetailViewController
            if let selectedRowIndex = self.tableView.indexPathForSelectedRow {
                if let nameData = simpson[selectedRowIndex.row].relatedTopics {
                    vc.nameLabel = nameData
                    print("Data has been passed!")
                }
                if let bioData = simpson[selectedRowIndex.row].relatedTopics{
                    vc.bioLabel = bioData
                }
                if let imageData = simpson[selectedRowIndex.row].relatedTopics {
                    vc.imageLabel = UIImage(data: imageData as Data)
                }
            
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let simpsonSelected = simpson[indexPath.row]
        
        performSegue(withIdentifier:"DetailVC", sender: simpsonSelected)
        
    }
    

}
