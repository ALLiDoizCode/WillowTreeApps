//
//  ViewController.swift
//  AnimeBoard
//
//  Created by Jonathan Green on 12/21/14.
//  Copyright (c) 2014 Jonathan Green. All rights reserved.
//

import UIKit
import Alamofire

var anime:String = "bleach"

//var favAnime:[String] = []

class ViewController: UIViewController{
    
var favAnime:[String] = []
    
///////OUTLETS/////////
    
    ///Views///
    
    
    
    ///Image
    
    
    @IBOutlet weak var fav: UICollectionView!
    
    @IBOutlet weak var Banner: UIImageView!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var smallImage: UIImageView!

    
    ///Labels
    @IBOutlet weak var UserName: UILabel!

    @IBOutlet weak var userInfo: UILabel!
    
    @IBOutlet weak var ActivityInfo: UILabel!
    
    @IBOutlet weak var timeFrame: UILabel!
    
    @IBOutlet weak var animeDays: UILabel!
    
    @IBOutlet weak var mangaChp: UILabel!
///////OUTLETS END/////////
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        userAuth(Banner,mainImage,smallImage,UserName,userInfo,ActivityInfo,timeFrame,animeDays,mangaChp)
        //apiAuth(mainImage,Banner,ran)
        //searchAuth()
        
        
        //println(favAnime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

