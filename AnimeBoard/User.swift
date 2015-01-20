//
//  User.swift
//  AnimeBoard
//
//  Created by Jonathan Green on 12/25/14.
//  Copyright (c) 2014 Jonathan Green. All rights reserved.
//

import UIKit
import Alamofire


///Authincation
 func userAuth(Banner:UIImageView,mainImage:UIImageView,smallImage:UIImageView,UserName:UILabel,userInfo:UILabel,ActivityInfo:UILabel,timeFrame:UILabel,animeDays:UILabel,mangaChp:UILabel){
    Alamofire.request(.POST, "https://anilist.co/api/auth/access_token", parameters: parameters)
        .responseJSON { (request, response, jsonData, error) in
            let json = JSON(object: jsonData!)
            let accessToken = json["access_token"].stringValue
            //Favorite(accessToken)
            userGet(accessToken!,Banner,mainImage,smallImage,UserName,userInfo,ActivityInfo,timeFrame,animeDays,mangaChp)
            
    }
}

///User Get
func userGet(Token:String,Banner:UIImageView,mainImage:UIImageView,smallImage:UIImageView,UserName:UILabel,userInfo:UILabel,ActivityInfo:UILabel,timeFrame:UILabel,animeDays:UILabel,mangaChp:UILabel){
    Alamofire.request(.GET, "https://anilist.co/api/user/Josh", parameters: ["access_token":"\(Token)"])
        .responseJSON { (request, response, jsonData, error) in
            var json = JSON(object:jsonData!)
            ///images
            var imageBig = json["image_url_lge"].stringValue
            var imageSmall = json["image_url_med"].stringValue
            var imageBanner = json["image_url_banner"].stringValue
            //labels
            var name = json["display_name"].stringValue
            var userAbout = json["about"].stringValue
            var days = json["anime_time"].stringValue
            var chapter = json["manga_chap"].stringValue
            //Adding Labels
            UserName.text = name
            userInfo.text = userAbout
            animeDays.text = days
            mangaChp.text = chapter
            //Adding Images
            var bgBig = UIImage(data: NSData(contentsOfURL: NSURL(string:imageBig!)!)!)
            mainImage.image = bgBig
            var bgSmall = UIImage(data: NSData(contentsOfURL: NSURL(string:imageSmall!)!)!)
           smallImage.image = bgBig
            var bgBanner = UIImage(data: NSData(contentsOfURL: NSURL(string:imageBanner!)!)!)
            Banner.image = bgBanner
            
            //// calling Favorite func
            favorite(Token)
    }
   
}

///Get Search Results
  func  favorite (Token:String){
    var favAnime:[String] = []
    Alamofire.request(.GET, "https://anilist.co/api/user/Josh/favourites", parameters: ["access_token":"\(Token)"])
        .responseJSON { (request, response, jsonData, error) in
            var json = JSON(object:jsonData!)
            var animeValue = json["anime"].arrayValue
            var animeCount = animeValue?.count
            //println("\(animeValue?.count)")
            for var i = 0; i < animeCount; i++ {
                var imageData = json["anime"][i]["image_url_med"].stringValue
                ViewController(favAnime.append(imageData!))
            
            }
            
        }
}

