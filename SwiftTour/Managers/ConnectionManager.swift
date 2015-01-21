//
//  ConnectionManager.swift
//  SwiftTour
//
//  Created by Fatih Nayebi on 2014-06-08.
//  Copyright (c) 2014 Fatih Nayebi. All rights reserved.
//

import UIKit

protocol ConnectionManagerProtocol {
  func didRecieveResults(results:NSDictionary)
}

class ConnectionManager: NSObject, NSURLConnectionDelegate, NSURLConnectionDataDelegate {
  
  var delegate:ConnectionManagerProtocol?
  var data: NSMutableData = NSMutableData()
  
  func sendRequest(request:NSURLRequest) {
    var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
    connection.start()
  }
  
  func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
    println("Connection failed.\(error.localizedDescription)")
  }
  
  func connection(connection: NSURLConnection, didRecieveResponse response: NSURLResponse)  {
    println("Recieved response")
  }
  
  func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
    // Recieved a new request, clear out the data object
    self.data = NSMutableData()
  }
  
  func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
    // Append the recieved chunk of data to our data object
    self.data.appendData(data)
  }
  
  func connectionDidFinishLoading(connection: NSURLConnection!) {
    // Request complete, self.data should now hold the resulting info
    // Convert the retrieved data in to an object through JSON deserialization
    var err: NSError
    var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
    
    // Now send the JSON result to our delegate object
    delegate?.didRecieveResults(jsonResult)
  }
  
}
