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
        
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=lactation&from=2022-06-29&sortBy=publishedAt&apiKey=c5b96338e8d64f81a4bfbbb4c665ea89")!)
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content.Type") // Enviar json por post
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        request.httpMethod = "GET"
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil, let respuesta = response as? HTTPURLResponse else {
                print("Ha habido un error en la conexión: \(error!)")
                return
            }
            if respuesta.statusCode == 200 {
                print("Traemos del server \(data)")
                do {
                    let decoder = JSONDecoder()
                    let getUrl = try decoder.decode([Welcome].self, from: data)
                } catch {
                    print("No se ha podido parsear el archivo, error: \( error)")
                }
            }else{
                print("Ha habido un error: \(respuesta.statusCode)")
            }
        }.resume()
        
    }

                    
//    let urlString = "https://newsapi.org/v2/everything?q=lactation&from=2022-06-29&sortBy=publishedAt&apiKey=c5b96338e8d64f81a4bfbbb4c665ea89"
//    let url = URL(string: urlString)
//    var request = URLRequest(url: url!)
//    request.httpMethod = "GET"
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        let httpResponse = response as? HTTPURLResponse
//        switch httpResponse?.statusCode{
//        case 200:
//            do{
//                if let jData = data {
//                    let dictionary = try JSONSerialization.jsonObject(with: data ?? Data()) as! [String : Any]
//                    print(dictionary)
//                    let decodedData = try? JSONDecoder().decode(Welcome.self,from: jData)
////                    guard let news = decodedData.data.articles else { return }
////                    self.presenter?.bringNews(news: )
//                    print("‼️jason \(decodedData!)‼️")
//                }
//            } catch {
//                print("Error Decodemode")
//            }
//        default:
//            print("Error service")
//        }
//    }.resume()
//}
}
    
//    func getNews(urlString: String, completion: @escaping ([Welcome]?) -> Void) {
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//            guard let data = data else {
//                completion(nil)
//                return
//            }
//            let decoder = JSONDecoder()
//            guard let decodedData = try? decoder.decode([Welcome].self, from: data) else {
//                completion(nil)
//                return
//            }
//
//            completion(decodedData)
//        }.resume()
//    }
//
//    func getNews(urlString: "https://newsapi.org/v2/everything?q=lactation&from=2022-06-29&sortBy=publishedAt&apiKey=c5b96338e8d64f81a4bfbbb4c665ea89") { (articles); in
//        if let news = news {
//            for new in news{
//                print(new.articles)
//            }
//        }
//
//
//    }
       
