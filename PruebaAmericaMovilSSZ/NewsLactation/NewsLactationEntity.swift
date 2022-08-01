//
//  NewsLactationEntity.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 29/07/22.
//
import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    var source: Source? 
    var author: String?
    var title: String?
    var articleDescription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: Date?
    var content: String?
}

// MARK: - Source
struct Source: Codable {
    var id: String?
    var name: String? 
}




