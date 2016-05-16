//
//  ViewController.swift
//  MVCSwift
//
//  Created by Hemen Gohil on 5/6/16.
//  Copyright © 2016 Hemen Gohil. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

//    @IBOutlet var tblView : UITableView
    @IBOutlet var tblView: UITableView!

    var items = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let itemsNormal = NSMutableArray()
        let dicData : NSMutableDictionary = [kUserId:"1", kUserName:"Hemen Gohil", kUserAddress:"201-A", kUserProfilePicURL:"http://wallpapercave.com/wp/WHVCozQ.jpg"]
        itemsNormal.addObject(dicData)

        let dicData1 : NSMutableDictionary = [kUserId:"1", kUserName:"ABC ABC", kUserAddress:"201-A", kUserProfilePicURL:"http://onehdwallpaper.com/wp-content/uploads/2015/07/Beautiful-HD-Parrot-Wallpaper.jpg"]
        itemsNormal.addObject(dicData1)

        let dicData2 : NSMutableDictionary = [kUserId:"1", kUserName:"Sky Walker", kUserAddress:"201-A", kUserProfilePicURL:"http://soviet-off.com/data/out/1/IMG_367575.jpg"]
        itemsNormal.addObject(dicData2)

        
        for dicData in itemsNormal {
            let objUser = User(data: dicData as! NSDictionary)
            items .addObject(objUser)
        }
        
        // Call Dispatch Queue Here..
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            dispatch_async(dispatch_get_main_queue()) {
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    // Number row
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return self.items.count
//    }
//    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    // Style Cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "cellIdentity"
        
        let cell : UITableViewCell = self.tblView.dequeueReusableCellWithIdentifier(identifier)!

        let objUser = self.items[indexPath.row] as! User
        
        cell.textLabel?.text = objUser.userName
        
        let url  = NSURL(string: objUser.userProfilePicURL)
        
        cell.imageView?.image = UIImage(named: "profile")
        cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.getDataFromUrl(url!) { (data1, response, error) in
            dispatch_async(dispatch_get_main_queue(), {
                cell.imageView?.image = UIImage(data: data1!)
            })
        }
        return cell
    }
    
    // Select row
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Select
        let objUser = self.items[indexPath.row] as! User
        objUser.description
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
}

