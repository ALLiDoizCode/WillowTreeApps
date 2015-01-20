//
//  GetAnime.swift
//  AnimeBoard
//
//  Created by Jonathan Green on 12/22/14.
//  Copyright (c) 2014 Jonathan Green. All rights reserved.
//

import UIKit
import Alamofire


let parameters = ["grant_type": "client_credentials", "client_id":"di3twater-1nxqk", "client_secret": "f9S24EMx8mgcPTsZcWKBdT"]

///Authincation
func apiAuth(StumbleTable: UITableView!,num:Int){
    Alamofire.request(.POST, "https://anilist.co/api/auth/access_token", parameters: parameters)
        .responseJSON { (request, response, jsonData, error) in
            let json = JSON(object: jsonData!)
            let accessToken = json["access_token"].stringValue
            apiGet(accessToken!,StumbleTable,num)
    }
}
//////Get anime/////
 func apiGet(Token:String,StumbleTable: UITableView!,num:Int){
    var filter:String? = "Comedy"
    var filterSum:Int = 0
    var f = 0
    Alamofire.request(.GET, "https://anilist.co/api/anime/\(num)", parameters: ["access_token":"\(Token)"])
    .responseJSON { (request, response, jsonData, error) in
        let json = JSON(object:jsonData!)
        var gArray = json["genres"].arrayValue
        var imageInfo:String? = json["image_url_lge"].stringValue
        var bannerdata:String? = json["image_url_banner"].stringValue
        var youtube:String? = json["youtube_id"].stringValue
        var gArray2 = gArray?.count
        for var i = 0; i < gArray2; i++ {
            var stumData:Stum = Stum()
            var compare = json["genres"][i].stringValue
            println(compare)
            if compare == filter {
                f = 1;
                println(f)
                if f == 1 || filter == nil{
                    println(imageInfo)
                    println("banner \(bannerdata)")
                    println("trailer \(youtube)")
                    ////imageLoop////
                    if imageInfo != nil && compare != "Hentai"{
                        var bgImage = UIImage(data: NSData(contentsOfURL: NSURL(string:imageInfo!)!)!)
                        
                    
                        StumbleTable.reloadData()
                        
                    }else{
                        println("image is nil")
                        var ran = Int(arc4random_uniform(9000)+1)
                        apiGet(Token,StumbleTable,ran)
                    }
                    ////imageLoop////
                }
            }
            
        }
        if f != 1 {
            println("filter does not match")
            var ran = Int(arc4random_uniform(9000)+1)
            apiGet(Token,StumbleTable,ran)
            
        }
        
    }

}