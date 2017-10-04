//
//  DataManager.swift
//  Rukkus
//
//  Created by abdelrahman mohamed on 10/4/17.
//  Copyright © 2017 abdelrahman mohamed. All rights reserved.
//

import Foundation
import Alamofire
import DZNEmptyDataSet
import ReachabilitySwift

protocol DataManagerDelegate: AnyObject {
    func dataLoaded()
}


class DataManager: NSObject  {
    
    weak var delegate: DataManagerDelegate?
    let reachability = Reachability()!
    
    let url = "http://api.rukkus.com/api/v1/events/?api_key=06aeacfb30f6bd6a7cab99d7fb8dba25"
    var serverResults: RukkusEvents? = RukkusEvents()
    
    
    
    

    override init() {
        super.init()
        loadData()
    }
  
    
    
    
    
    func loadData() {
        if !reachability.isReachable { return }
        request(url, method: .get, parameters: nil, headers: nil).responseJSON { (response) in
            if let responseObj = RukkusEvents(response.result.value) {
                self.serverResults = responseObj
                self.delegate?.dataLoaded()
            }else{
                self.serverResults = nil
            }
        }
    }
    
    
    var numberOfSections = 1
    
    var numberOfRows: Int {
        return serverResults?.results?.count ?? 0
    }
    
    func cellInfoFor(index: IndexPath) -> RukkusResults? {
        return serverResults?.results?[index.row]
    }
    
}


extension DataManager: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate  {
    
    
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)]

        if !reachability.isReachable {
            return NSAttributedString(string: "Network errror!", attributes: attrs)
        }
        
        
        
        switch serverResults {
        case .none:
            let message = "Server error?"
            return NSAttributedString(string: message, attributes: attrs)
        case .some(let value):
            if value.results == nil {
                let message = "Loading .."
                return NSAttributedString(string: message, attributes: attrs)
            }
        }
        return NSAttributedString(string: "message", attributes: attrs)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)]
       
        if !reachability.isReachable {
            return NSAttributedString(string: "Check your connection!", attributes: attrs)
        }
        
        switch serverResults {
        case .none:
            let message = "Server error? We're sorry!"
            return NSAttributedString(string: message, attributes: attrs)
        case .some(let value):
            if value.results == nil {
                let message = "Hold on, we're getting your fav events!"
                return NSAttributedString(string: message, attributes: attrs)
            }
        }
        return NSAttributedString(string: "message", attributes: attrs)

    }
    
  
}

