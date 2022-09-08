//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Dmytro Vasylenko on 29.08.2022.
// 
//

import Foundation
import UIKit

class NewsListTableViewController: BaseClass {
    
    private var articleListVM: ArticleListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=d4d9c669b1e049679c8e073fcd76714a")!
        Webservice().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell not found") }
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titlleLable.text = articleVM.title
        cell.descriptionLable.text = articleVM.description
        return cell 
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


