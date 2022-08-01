//
//  NewsLactationInteractor.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 29/07/22.
//  
//

import Foundation

class NewsLactationInteractor: NewsLactationInteractorProtocol {
    var presenter: NewsLactationPresenterProtocol?
    
    func getNews(){
        
        let urlString = "https://newsapi.org/v2/everything?q=lactation&from=2022-07-01&sortBy=publishedAt&apiKey=7d97a74f6be24295a78eedd644a7130b"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            switch httpResponse?.statusCode{
            case 200:
                do{
                    if let jData = data {
                        let dictionary = try JSONSerialization.jsonObject(with: jData, options: []) as! [String : Any]
                        print(dictionary)
                        var notices: [Article] = []
                        dictionary.forEach { value in
                            if value.key == "articles" {
                                var noticeNew = value.value as? [AnyObject]
                                noticeNew?.forEach{ va in
                                    var notice = Article()
                                    notice.url = va["url"] as? String
                                    notice.title = va["title"] as? String
                                    notice.articleDescription = va["articleDescription"] as? String
                                    notice.content = va["content"] as? String
                                    notices.append(notice)
                                }
                            }
                        }
                        self.presenter?.bringNews(news: notices)
                    }
                } catch {
                    print("Error Decodemode")
                }
            default:
                print("Error service")
            }
        }.resume()
    }
}
