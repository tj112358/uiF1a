import UIKit
import SwiftSoup

func getNews() {
    let url = URL (string: "https://www.f1academy.com/Latest")!
    let html = try? String(contentsOf: url, encoding: .utf8)
    let document = try! SwiftSoup.parse(html ?? "")
    
    for i in 0...20 {
        let headline = try! document.select("div.row div.article-listing-card--item:eq(\(i)) .font-text-body")
        let title = try! document.select("div.row div.article-listing-card--item:eq(\(i)) .font-tag")
        let address = try! document.select("div.row div.article-listing-card--item:eq(\(i)) a")
        let addressNew = ("https://www.f1academy.com" + "\(try! address.attr("href"))")
        let image = try! document.select("div.row div.article-listing-card--item:eq(\(i)) a div.f1-cc--image img.f1-cc--photo")
        let imageNew = "\(try! image.attr("data-src"))"
        
        let news = ["\(try! headline.text())", "\(try! title.text())", imageNew, addressNew]
        
//        headline2 (headline: "\(try! headline.text())", title: "\(try! title.text())", img: imageNew, address: addressNew)
        
    }

}
