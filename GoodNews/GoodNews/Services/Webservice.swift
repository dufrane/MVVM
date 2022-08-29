//
//  Webservice.swift
//  GoodNews
//
//  Created by Dmytro Vasylenko on 29.08.2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?)->()) {
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                
                print(data)
            }
        }.resume()
    }
}
