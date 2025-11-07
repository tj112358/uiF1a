//
//  NewsPage.swift
//  app2
//
//  Created by Thea Yocum on 9/18/25.
//

import SwiftUI
import WebKit
import SwiftSoup



struct headline2: View {
    var headline: String
    var title: String
    var img: String
    var address: String
    
    var body: some View {
        NavigationLink(destination: WebView(url: URL(string: address))) {
            VStack(alignment: .leading, spacing: 20.0){
                HStack{
                    Image(uiImage: img.load())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 90)
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 15, bottomLeading: 15)))
                    VStack(alignment: .leading){
                        Text(title .uppercased())
                            .foregroundColor(Color(snow))
                            .font(.system(size: 12))
                        Text(headline)
                            .font(.custom("Formula1-Display-Bold", size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color(snow))
                            .lineLimit(3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.leading, 5)
                    .padding(.trailing, 10)
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                }
            }
            .background(Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity)
                .cornerRadius(15)
                .foregroundColor(Color(olive))
                        //.shadow(radius: 5)
            )
            .padding(.top, 5)
            .padding(.horizontal)
        }
    }
}

struct Headliner: View {
    var headline: String
    var title: String
    var img: String
    var address: String
    
    var body: some View{
        NavigationLink(destination: WebView(url: URL(string: address))) {
            ZStack{
                /*GeometryReader {proxy in
                 Image(uiImage: img.load())
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: proxy.size.width, height: 275)
                 }*/
                Image(uiImage: img.load())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(15)
                VStack{
                    Spacer()
                    VStack(alignment: .leading){
                        Text(title)
                            .foregroundColor(Color(jet))
                            .font(.custom("ProximaNova-Medium", size: 15))
                        Text(headline)
                            .font(.custom("Formula1-Display-Bold", size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(Color(jet))
                            .lineLimit(3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .padding(.top, 40)
                    .background(Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 41/255, green: 42/255, blue: 39/255, alpha: 0)), Color(UIColor(red: 41/255, green: 42/255, blue: 39/255, alpha: 0.70))]), startPoint: .top, endPoint: .bottom))
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 15, bottomTrailing: 15)))
                    )
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 5)
            .padding(.horizontal)
            
        }
    }
}

struct News: Identifiable {
    let newsValue: Int
    let id = UUID()
}

struct NewsBIG: Identifiable {
    let newsValue: Int
    let id = UUID()
}

struct NewsPage: View {
    
    private let newsBIG = [
        News(newsValue: 0)
    ]
    
    private let news = [
        News(newsValue: 1),
        News(newsValue: 2),
        News(newsValue: 3),
        News(newsValue: 4),
        News(newsValue: 5),
        News(newsValue: 6),
        News(newsValue: 7),
        News(newsValue: 8),
        News(newsValue: 9),
        News(newsValue: 10),
        News(newsValue: 11),
        News(newsValue: 12),
        News(newsValue: 13),
        News(newsValue: 14),
        News(newsValue: 15),
        News(newsValue: 16),
        News(newsValue: 17),
        News(newsValue: 18),
        News(newsValue: 19),
        News(newsValue: 20)
    ]
    
    var body: some View {
        
        let url = URL (string: "https://www.f1academy.com/Latest")!
        let html = try? String(contentsOf: url, encoding: .utf8)
        let document = try! SwiftSoup.parse(html ?? "")
        
        NavigationView {
            ZStack{
                Color(jet) //i am the background
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{ //i am the top bar w race countdown
                        VStack{
                            Text("nextrace")
                                .font(.custom("Formula1-Display-Regular", size: 30))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("SEP 19-20")
                                .font(.custom("Formula1-Display-Regular", size: 12))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Spacer()
                        Text("00:00:00")
                            .font(.custom("Formula1-Display-Regular", size: 24))
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(jet))
                    //.background(Color(olive))
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(blue), Color(purple), Color(pink)]), startPoint: .leading, endPoint: .trailing)
                    )
                    //Here is the main part of the view
                    ScrollView {
                        VStack{ //i am the main news scroll page
                            ForEach(newsBIG, id: \.id) { newsBIG in
                                let headline = try! document.select("div.row div.article-listing-card--item:eq(\(newsBIG.newsValue)) .font-text-body")
                                let title = try! document.select("div.row div.article-listing-card--item:eq(\(newsBIG.newsValue)) .font-tag")
                                let address = try! document.select("div.row div.article-listing-card--item:eq(\(newsBIG.newsValue)) a")
                                
                                let addressNew = ("https://www.f1academy.com" + "\(try! address.attr("href"))")
                                
                                let image = try! document.select("div.row div.article-listing-card--item:eq(\(newsBIG.newsValue)) a div.f1-cc--image img.f1-cc--photo")
                                
                                let imageNew = "\(try! image.attr("data-src"))"
                                
                                Headliner (headline: "\(try! headline.text())", title: "\(try! title.text())", img: imageNew, address: addressNew)
                            }
                            
                            ForEach(news, id: \.id) { news in
                                let headline = try! document.select("div.row div.article-listing-card--item:eq(\(news.newsValue)) .font-text-body")
                                let title = try! document.select("div.row div.article-listing-card--item:eq(\(news.newsValue)) .font-tag")
                                let address = try! document.select("div.row div.article-listing-card--item:eq(\(news.newsValue)) a")
                                
                                let addressNew = ("https://www.f1academy.com" + "\(try! address.attr("href"))")
                                
                                let image = try! document.select("div.row div.article-listing-card--item:eq(\(news.newsValue)) a div.f1-cc--image img.f1-cc--photo")
                                
                                let imageNew = "\(try! image.attr("data-src"))"
                                
                                headline2 (headline: "\(try! headline.text())", title: "\(try! title.text())", img: imageNew, address: addressNew)
                            }
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    NewsPage()
}

