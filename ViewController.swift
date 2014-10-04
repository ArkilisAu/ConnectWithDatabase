//
//  ViewController.swift
//  ConnectWithDatabase
//
//  Created by Ben Liu on 29/09/2014.
//  Copyright (c) 2014 Ben Liu. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnConnect(sender: AnyObject) {
        
        let url = NSURL(string:"http://54.210.200.34/db.php")
        let cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
        var request = NSMutableURLRequest(URL: url, cachePolicy: cachePolicy, timeoutInterval: 2.0)
        request.HTTPMethod = "POST"
        
        // set Content-Type in HTTP header
        let boundaryConstant = "----------V2ymHFg03esomerandomstuffhbqgZCaKO6jy";
        let contentType = "multipart/form-data; boundary=" + boundaryConstant
        NSURLProtocol.setProperty(contentType, forKey: "Content-Type", inRequest: request)
        
        // set data
        var dataString = "submit"
        let requestBodyData = (dataString as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPBody = requestBodyData
        
        // set content length
        NSURLProtocol.setProperty(requestBodyData!.length, forKey: "Content-Length", inRequest: request)
        
        var response: NSURLResponse? = nil
        var error: NSError? = nil
        let reply = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error: &error)
        
        let results = NSString(data:reply!, encoding:NSUTF8StringEncoding)
        println("API Response: \(results)")
        
    }
}

