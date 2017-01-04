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
        
        tableView.estimatedRowHeight = 232.0
        tableView.rowHeight = UITableViewAutomaticDimension
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl?.addTarget(self, action:#selector(refreshTheTable), for: UIControlEvents.valueChanged)
        tableView.addSubview(self.refreshControl!)
        
        dribbbleTableViewControllerViewModel.delegate = self
        dribbbleTableViewControllerViewModel.loadShots()
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
        if ( dribbbleTableViewControllerViewModel.getCellVMArrayCount()>0){
            cell.setupCell(viewModel: dribbbleTableViewControllerViewModel.getShotVM(forIndex: indexPath.row)!)
        }
        return cell
    }

    func dataDidfinishLoadingSuccessfully(){
        if (self.refreshControl?.isRefreshing)! {
        self.refreshControl?.endRefreshing()
        }
        self.tableView.reloadData()
    }
    
    func noInternetConnection(){
        if (self.refreshControl?.isRefreshing)! {
            self.refreshControl?.endRefreshing()
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
