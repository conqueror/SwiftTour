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
    let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
    
    // Now escape anything else that isn't URL-friendly
    let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())

    let urlPath = "https://itunes.apple.com/search?term=" + escapedSearchTerm! + "&media=software"
    
    
    let url = NSURL(string: urlPath)
    if let noneNilUrl = url {
      let request: NSURLRequest = NSURLRequest(URL: noneNilUrl)
      print("Search iTunes API at URL \(noneNilUrl)")
      connectionManager.delegate = self
      connectionManager.sendRequest(request)
    }
  }
  
  func didRecieveResults(results: NSDictionary) {
    delegate?.storePreparedData(results)
    
  }
  
}
