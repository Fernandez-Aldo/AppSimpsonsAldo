//
//  JsonFile.swift
//  
//
//  Created by MAC Consultant on 03/01/19.
//  Copyright © 2019 Aldo. All rights reserved.
//

import UIKit


class JSONManager {
    
     var mainView = SimpsonsTableViewController()
    
    func downloadSimpsons(completion: @escaping ([Simpsons.RelatedTopics])->()) {
        let url = URL(string: "https://api.duckduckgo.com/?q=simpsons+characters&format=json")!
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let json = try! JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String:Any]
            
            let characters =  json["RelatedTopics"] as! [[String:Any]]
            
            for character in characters {
                let imageDict = character["Icon"] as! [String:String]
                let imageURL = imageDict["URL"]! as String
    
                let text = character["Text"] as! String
               
                let separated = text.components(separatedBy: " - ")
    
                    DispatchQueue.main.async {
                        
                            self.mainView
                        }
                
                    }
            }
    
    func downloadImage(_ urlString: String,
                       completion: @escaping (Data)->()) {
        
        var url = URL(string: urlString) //?? URL.init(fileURLWithPath: filePath!)
        if url == nil {
            url = URL(string:"https://vignette.wikia.nocookie.net/simpsons/images/f/f3/Thomas_Pynchon.png/revision/latest?cb=20130718201352")
        }
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let safeData = data {
                //print("Did receive image data")
                completion(safeData)
            }
            
        }
        print(dataTask)
        dataTask.resume()
        
    }}
}
