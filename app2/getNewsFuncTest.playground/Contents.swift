import UIKit
import SwiftSoup

func getNews() -> [Any] {
    var news = [Any]()
    
    struct newsCard {
        var headline: String
        var title: String
        var image: String
        var address: String
    }
    
    let url = URL (string: "https://www.f1academy.com/Latest")!
    let html = try? String(contentsOf: url, encoding: .utf8)
    let document = try! SwiftSoup.parse(html ?? "")
    
    for i in 0...19 {
        let headline = try! document.select("div.row div.article-listing-card--item:eq(\(i)) .font-text-body")
        let title = try! document.select("div.row div.article-listing-card--item:eq(\(i)) .font-tag")
        let address = try! document.select("div.row div.article-listing-card--item:eq(\(i)) a")
        let addressNew = ("https://www.f1academy.com" + "\(try! address.attr("href"))")
        let image = try! document.select("div.row div.article-listing-card--item:eq(\(i)) a div.f1-cc--image img.f1-cc--photo")
        let imageNew = "\(try! image.attr("data-src"))"
        
        news.append(newsCard(headline: "\(try! headline.text())", title: "\(try! title.text())", image: imageNew, address: addressNew))
    }
    return news
}

//guard let news = getNews() else {
//    
//}
