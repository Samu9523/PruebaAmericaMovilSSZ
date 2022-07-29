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
    
    func getNews() {
        let urlString = "https://newsapi.org/v2/everything?q=lactation&from=2022-06-29&sortBy=publishedAt&apiKey=c5b96338e8d64f81a4bfbbb4c665ea89"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            switch httpResponse?.statusCode{
            case 200:
                do{
                    if let jData = data {
                        let dictionary = try JSONSerialization.jsonObject(with: data ?? Data()) as! [String : Any]
                        print(dictionary)
                        let decodedData = try? JSONDecoder().decode(Welcome.self,from: jData)
//                        self.presenter?.dataNews()
                        print(decodedData!)
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
