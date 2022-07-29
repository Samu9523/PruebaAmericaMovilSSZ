//
//  NewsLactationEntity.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 29/07/22.
//
import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    var status: String? = nil
    var totalResults: Int? = nil
    var articles: [Article]? = nil
}

// MARK: - Article
struct Article: Codable {
    var source: Source? = nil
    var author: String? = nil
    var title: String? = nil
    var articleDescription: String? = nil
    var url: String? = nil
    var urlToImage: String? = nil
    var publishedAt: Date? = nil
    var content: String? = nil
}

// MARK: - Source
struct Source: Codable {
    var id: String? = nil
    var name: String? = nil
}




