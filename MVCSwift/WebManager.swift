//
//  WebManager.swift
//  MVCSwift
//
//  Created by Hemen Gohil on 5/6/16.
//  Copyright © 2016 Hemen Gohil. All rights reserved.
//

import UIKit



class WebManager: NSObject {
    
    
    // Initial Setup URLs....
    
    class func postDataToURL(mode : String, params : AnyObject, message : String, completionSuccess : (AnyObject)->Void) {

        if message.characters.count>0 {
            SVProgressHUD.showWithStatus(message)
            SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.Flat)
        }
        
        let domainURL = "http://11.22.33.444/"
        let urlToRequestOn = domainURL + "AppName/" + mode + ".php"
        
        // Setup the session to make REST POST call
        let postEndpoint: String = urlToRequestOn
        print("URL TO REQUEST : "+postEndpoint)
        
        let url = NSURL(string: postEndpoint)!
        
        let session = NSURLSession.sharedSession()
        let postParams = params
//        let postParams : [String: AnyObject] = ["hello": "Hello POST world"]
        
        // Create the request
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(postParams, options: NSJSONWritingOptions())
            print(params)
        } catch {
            print("bad things happened")
        }

        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) in
            
            SVProgressHUD .dismiss()
            
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            do{
                let response = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                completionSuccess(response)
                
            }catch{
            }
        }
        dataTask.resume()
    
    }
}
