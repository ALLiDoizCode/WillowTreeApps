//
//  Search.swift
//  AnimeBoard
//
//  Created by Jonathan Green on 12/22/14.
//  Copyright (c) 2014 Jonathan Green. All rights reserved.
//

import UIKit
import Alamofire

///Authincation
func searchAuth(){
    Alamofire.request(.POST, "https://anilist.co/api/auth/access_token", parameters: parameters)
        .responseJSON { (request, response, jsonData, error) in
            let json = JSON(object: jsonData!)
            let accessToken = json["access_token"].stringValue
            apiSearch(accessToken!)
    }
}

///Get Search Results
func apiSearch(Token:String){
    Alamofire.request(.GET, "https://anilist.co/api/anime/search/Attack", parameters: ["access_token":"\(Token)"])
        .responseJSON { (request, response, jsonData, error) in
            let json = JSON(object:jsonData!)
            println(json)
            
    }
}


// Class: urlInfo to be seen through all Classes
class AuthInfo {
    // Class function: Return URL request so we only need to define it once in code
    class func getAuth() -> NSURLRequest {
        var url: NSURL? = NSURL(string: "https://anilist.co/api/auth/access_token")
        var urlRequest: NSURLRequest? = NSURLRequest(URL: url!)
        
        return urlRequest!
    }
}
