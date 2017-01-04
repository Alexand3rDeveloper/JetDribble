//
//  DribbbleTableViewController.swift
//  JetDribble
//
//  Created by Alex on 12/20/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit


class DribbbleTableViewController: UITableViewController, DataPresentable {
    
    private var dribbbleTableViewControllerViewModel = DribbbleTableViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupResizableCellHeight()
        self.setupRefreshController()
        
        dribbbleTableViewControllerViewModel.delegate = self
        dribbbleTableViewControllerViewModel.loadShots()
    }
    
    private func setupResizableCellHeight() {
        tableView.estimatedRowHeight = 232.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func setupRefreshController() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl?.addTarget(self, action:#selector(refreshTheTable), for: UIControlEvents.valueChanged)
        tableView.addSubview(self.refreshControl!)
    }
    
    func refreshTheTable() {
        self.refreshControl?.beginRefreshing()
         dribbbleTableViewControllerViewModel.loadShots()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  dribbbleTableViewControllerViewModel.getCellVMArrayCount()
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ShotCell = tableView.dequeueReusableCell(withIdentifier: "shotCell", for: indexPath) as! ShotCell
        
        // Configure the cell...
        if ( dribbbleTableViewControllerViewModel.getCellVMArrayCount()>0) {
            cell.setupCell(viewModel: dribbbleTableViewControllerViewModel.getShotVM(forIndex: indexPath.row)!)
        }
        return cell
    }

    func dataDidfinishLoadingSuccessfully() {
        if (self.refreshControl?.isRefreshing)! {
        self.refreshControl?.endRefreshing()
        }
        self.tableView.reloadData()
    }
    
    func noInternetConnection() {
        if (self.refreshControl?.isRefreshing)! {
            self.refreshControl?.endRefreshing()
        }
    }
}
