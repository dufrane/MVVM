//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Mohammad Azam on 2/5/19.
// 
//

import Foundation
import UIKit

class NewsListTableViewController: BaseClass {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=d4d9c669b1e049679c8e073fcd76714a")!
        Webservice().getArticles(url: url) { _ in
            
        }
        
    }
    
}


extension UITableViewController {

    func statusBarColorChange() {
        let statusBar = UIView(frame: UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
        statusBar.backgroundColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        statusBar.tag = 100
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(statusBar)
    }
}

class BaseClass: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        self.statusBarColorChange()
    }
}


