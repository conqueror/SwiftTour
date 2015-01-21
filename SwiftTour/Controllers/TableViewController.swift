//
//  TableViewController.swift
//  SwiftTour
//
//  Created by Fatih Nayebi on 2014-06-08.
//  Copyright (c) 2014 Fatih Nayebi. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
  // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
    cell.textLabel?.text = "Row # \(indexPath.row)"
    cell.detailTextLabel?.text = "Subtitle #\(indexPath.row)"
    return cell
  }
}