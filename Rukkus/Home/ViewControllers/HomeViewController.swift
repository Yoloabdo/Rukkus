//
//  HomeViewController.swift
//  Rukkus
//
//  Created by abdelrahman mohamed on 10/4/17.
//  Copyright © 2017 abdelrahman mohamed. All rights reserved.
//

import UIKit
import DZNEmptyDataSet


class HomeViewController: UITableViewController {

    fileprivate var manager: DataManager!
    
    fileprivate struct storyBoard {
        static let CellID = "TLCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager = DataManager()
        manager?.delegate = self
        tableView.emptyDataSetSource = manager
        tableView.emptyDataSetDelegate = manager
        
        tableView.tableFooterView = UIView()

        // Do any additional setup after loading the view.
    }

    @IBAction func refreshData(_ sender: Any) {
        // Fetch Weather Data
        manager.loadData()
    }
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DetailsViewController
        dest.viewSelectedData = manager.cellInfoFor(index: tableView.indexPathForSelectedRow!)
    }
    
}

extension HomeViewController: DataManagerDelegate {
    func dataLoaded() {
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
}

extension HomeViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return manager.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: storyBoard.CellID, for: indexPath) as! HomeTableViewCell
        
        cell.configureCellWith(data: manager.cellInfoFor(index: indexPath)!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
   
}
