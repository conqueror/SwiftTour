//
//  ItunesStore.swift
//  SwiftTour
//
//  Created by Fatih Nayebi on 2014-06-08.
//  Copyright (c) 2014 Fatih Nayebi. All rights reserved.
//

import UIKit

protocol StoreProtocol {
  func storePreparedData(results:NSDictionary)
}

class ItunesStore: NSObject, ConnectionManagerProtocol {
  
  var delegate:StoreProtocol?
  var connectionManager:ConnectionManager = ConnectionManager()
  
  func searchItunesFor(searchTerm: String) {
    
    // The iTunes API wants multiple terms separated by + symbols, so replace spaces with + signs
    var itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
    
    // Now escape anything else that isn't URL-friendly
    var escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    var urlPath = "https://itunes.apple.com/search?term=" + escapedSearchTerm! + "&media=software"
    
    var url = NSURL(string: urlPath)
    if let noneNilUrl = url {
      var request: NSURLRequest = NSURLRequest(URL: noneNilUrl)
      println("Search iTunes API at URL \(noneNilUrl)")
      connectionManager.delegate = self
      connectionManager.sendRequest(request)
    }
  }
  
  func didRecieveResults(results: NSDictionary) {
    delegate?.storePreparedData(results)
    
  }
  
}
