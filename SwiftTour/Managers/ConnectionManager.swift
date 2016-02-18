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
    let connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
    connection.start()
  }
  
  func connection(connection: NSURLConnection, didFailWithError error: NSError) {
    print("Connection failed.\(error.localizedDescription)")
  }
  
  func connection(connection: NSURLConnection, didRecieveResponse response: NSURLResponse)  {
    print("Recieved response")
  }
  
  func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
    // Recieved a new request, clear out the data object
    self.data = NSMutableData()
  }
  
  func connection(connection: NSURLConnection, didReceiveData data: NSData) {
    // Append the recieved chunk of data to our data object
    self.data.appendData(data)
  }
  
  func connectionDidFinishLoading(connection: NSURLConnection) {
    // Request complete, self.data should now hold the resulting info
    // Convert the retrieved data in to an object through JSON deserialization
    
    do {
      let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
      self.delegate?.didRecieveResults(jsonResult)
    } catch let error as NSError {
      print("json error" + error.localizedDescription)
    }
    
    
  }
  
  
  
}

