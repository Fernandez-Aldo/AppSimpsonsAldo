//
//  Simpsons+CoreDataProperties.swift
//  
//
//  Created by MAC Consultant on 03/01/19.
//  Copyright © 2019 Aldo. All rights reserved.
//

import Foundation



struct Simpsons: Decodable {
    
    struct ImageStruct {
        var image: Data?
    }
    
    struct RelatedTopics: Decodable {
        var firstUrl : String
        var result: String
        var text: String
        var url: Icon
        //Custom Keys
        enum CodingKeys: String, CodingKey {
            case firstUrl = "FirstURL"
            case result = "Result"  //Custom keys
            case text = "Text" //Custom keys
            case url = "Icon"
        }
        
        
    }
    
    struct Icon: Decodable {
        var url: String
        
        enum CodingKeys: String, CodingKey {
            case url = "URL"
        }
    }
    
    let relatedTopics: [RelatedTopics]
   
    
}
extension Simpsons {
    enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}
