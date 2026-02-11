import UIKit
import SwiftSoup

struct newsCard {
    var headline: String
    var title: String
    var image: String
    var address: String
}

func getNews() -> [newsCard] {
    
    var news = [newsCard]()

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
var news: [newsCard] = getNews()

news[1].headline

///so the plan:
///1. need "persistant storage" of news: [newsCard] = getNews()
///2. getNews() gets called on the schedule, reupdating the persistant storage
///      2.1. driver data, points ranking, race data only updates after any given race
///      2.2. news data updates regularly, needs pull to refresh option (should fetch when app loads)

