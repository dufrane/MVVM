//
//  Article.swift
//  GoodNews
//
//  Created by Dmytro Vasylenko on 29.08.2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
