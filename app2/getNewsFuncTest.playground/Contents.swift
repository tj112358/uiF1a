import UIKit
import SwiftSoup


struct driver {
    let standing: String
    let pts: String
    let person: String
    let abrv: String
    let histno: String
}

func getStandings() -> [driver]{
    
    //array of nightmares
    let girlypop = [
            Driver(personValue: 1, name: "EDG"), //Jessica Edgar
            Driver(personValue: 2, name: "PUL"), //Abbi Pulling
            Driver(personValue: 3, name: "BUS"), //Bianca Bustamante
            Driver(personValue: 4, name: "BUH"), //Léna Bühler
            Driver(personValue: 5, name: "SCH"), //Carrie Schreiner
            Driver(personValue: 6, name: "MAR"), //Nerea Martí
            Driver(personValue: 7, name: ""), //empty page???
            Driver(personValue: 8, name: ""), //* Driver 1 TBA
            Driver(personValue: 9, name: ""), //* Driver 2 TBA
            Driver(personValue: 10, name: ""), //* Driver 3 TBA
            Driver(personValue: 11, name: ""), //* Driver 4 TBA
            Driver(personValue: 12, name: ""), //* Driver 5 TBA
            Driver(personValue: 13, name: ""), //* Driver 6 TBA
            Driver(personValue: 14, name: ""), //* Driver 7 TBA
            Driver(personValue: 15, name: ""), //* Driver 8 TBA
            Driver(personValue: 16, name: ""), //* Driver 9 TBA
            Driver(personValue: 17, name: ""), //* Wild Card
            Driver(personValue: 18, name: ""), //* Driver 11 TBA
            Driver(personValue: 19, name: ""), //* Driver 12 TBA
            Driver(personValue: 20, name: ""), //* Driver 14 TBA
            Driver(personValue: 21, name: ""), //* Driver 15 TBA
            Driver(personValue: 22, name: ""), //* Driver 16 TBA
            Driver(personValue: 23, name: "LOV"), //Lola Lovinfosse
            Driver(personValue: 24, name: "CAC"), //Maite Cáceres
            Driver(personValue: 25, name: "GIL"), //Megan Gilkes
            Driver(personValue: 26, name: "CHO"), //Chloe Chong
            Driver(personValue: 27, name: "AAL"), //Amna Al Qubaisi
            Driver(personValue: 28, name: "HAL"), //Hamda Al Qubaisi
            Driver(personValue: 29, name: "DEH"), //Emely De Heus
            Driver(personValue: 30, name: "GRA"), //Chloe Grant
            Driver(personValue: 31, name: "GAR"), //Marta García
            Driver(personValue: 32, name: "BLO"), //Lia Block
            Driver(personValue: 33, name: "HAU"), //Tina Hausmann
            Driver(personValue: 34, name: "PIN"), //Doriane Pin
            Driver(personValue: 35, name: "CHA"), //Chloe Chambers
            Driver(personValue: 36, name: "WEU"), //Maya Weug
            Driver(personValue: 37, name: "NOB"), //Aurelia Nobels
            Driver(personValue: 38, name: ""), //Reema Juffali
            Driver(personValue: 39, name: "CRO"), //Courtney Crone
            Driver(personValue: 40, name: "GAD"), //Nina Gademan
            Driver(personValue: 41, name: "LLO"), //Ella Lloyd
            Driver(personValue: 42, name: "PAL"), //Alisha Palmowski
            Driver(personValue: 43, name: ""), //Logan Hannah
            Driver(personValue: 44, name: "FEL"), //Emma Felbermayr
            Driver(personValue: 45, name: "LAR"), //Alba Larsen
            Driver(personValue: 46, name: "FER"), //Rafaela Ferreira
            Driver(personValue: 47, name: ""), //empty page???
            Driver(personValue: 48, name: "SHI"), //Wei Shi (WCD)
            Driver(personValue: 49, name: "HAV"), //Nicole Havrda
            Driver(personValue: 50, name: "ANA"), //Aiva Anagnostiadis
            Driver(personValue: 51, name: "CIC"), //Joanne Ciconte
            Driver(personValue: 52, name: "FAY"), //Farah AlYousef (WCD)
            Driver(personValue: 53, name: "DOB"), //Ava Dobson (WCD)
            Driver(personValue: 54, name: "PAA"), //Mathilda Paatz (WCD)
            Driver(personValue: 55, name: "KOS"), //Esmee Kosterman (WCD)
            Driver(personValue: 56, name: "BRU"), //Megan Bruce
            Driver(personValue: 57, name: "BIL"), //Lisa Billard (WCD)
            Driver(personValue: 58, name: "ROB"), //Rachel Robertson
            Driver(personValue: 59, name: ""), //Payton Westcott (WCD)
            Driver(personValue: 60, name: ""), //Mathilda Paatz
            Driver(personValue: 61, name: ""), //Kaylee Countryman
            Driver(personValue: 62, name: ""), //Lisa Billard
            Driver(personValue: 63, name: ""), //Jade Jacquet
            Driver(personValue: 64, name: ""), //Ella Stevens
            Driver(personValue: 65, name: ""), //* Driver 17 TBA
            Driver(personValue: 66, name: ""), //Esmee Kosterman
            Driver(personValue: 67, name: ""), //Ava Dobson
            Driver(personValue: 68, name: ""), //Payton Westcott
            Driver(personValue: 69, name: ""), //
            Driver(personValue: 70, name: ""), //
            Driver(personValue: 71, name: "") //
        ]
    
    var drivers = [driver]()
    
    let url = URL (string: "https://www.f1academy.com/Racing-Series/Standings/Driver?seasonId=3")!
    let html = try? String(contentsOf: url, encoding: .utf8)
    let document = try! SwiftSoup.parse(html ?? "")
    
    for i in 0...23 {
        let standing = try! document.select("tbody tr:eq(\(i)) .pos")
        let pts = try! document.select("tbody tr:eq(\(i)) .total-points")
        let person = try! document.select("tbody tr:eq(\(i)) .visible-desktop-up")
        let abrv = try! document.select("tbody tr:eq(\(i)) .visible-desktop-down")
        let abrvText = try! abrv.text()
        let histno = "\(girlypop.last {$0.name == abrvText}?.personValue, default: "1000")"
        
        drivers.append(driver(standing: "\(try! standing.text())", pts: "\(try! pts.text())", person: "\(try! person.text())", abrv: "\(try! abrv.text())", histno: "\(histno)"))
    }

    return drivers
}

var standings: [driver] = getStandings()

standings[1].person




//struct newsCard {
//    var headline: String
//    var title: String
//    var image: String
//    var address: String
//}
//
//func getNews() -> [newsCard] {
//    
//    var news = [newsCard]()
//
//        let url = URL (string: "https://www.f1academy.com/Latest")!
//        let html = try? String(contentsOf: url, encoding: .utf8)
//        let document = try! SwiftSoup.parse(html ?? "")
//
//    for i in 0...19 {
//        let headline = try! document.select("div.row div.article-listing-card--item:eq(\(i)) .font-text-body")
//        let title = try! document.select("div.row div.article-listing-card--item:eq(\(i)) .font-tag")
//        let address = try! document.select("div.row div.article-listing-card--item:eq(\(i)) a")
//        let addressNew = ("https://www.f1academy.com" + "\(try! address.attr("href"))")
//        let image = try! document.select("div.row div.article-listing-card--item:eq(\(i)) a div.f1-cc--image img.f1-cc--photo")
//        let imageNew = "\(try! image.attr("data-src"))"
//        
//        news.append(newsCard(headline: "\(try! headline.text())", title: "\(try! title.text())", image: imageNew, address: addressNew))
//    }
//    
//    return news
//}
//var news: [newsCard] = getNews()
//
//news[1].headline

///so the plan:
///1. need "persistant storage" of news: [newsCard] = getNews()
///2. getNews() gets called on the schedule, reupdating the persistant storage
///      2.1. driver data, points ranking, race data only updates after any given race
///      2.2. news data updates regularly, needs pull to refresh option (should fetch when app loads)
