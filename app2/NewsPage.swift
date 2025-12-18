//
//  NewsPage.swift
//  app2
//
//  Created by Thea Yocum on 9/18/25.
//

import SwiftUI
import WebKit
import SwiftSoup

//TODO: add instagram moments style on homepage

//TODO: asynch loading of news page

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
                            .foregroundColor(.typeface)
                            .font(.system(size: 12))
                        Text(headline)
                            .font(.custom("Formula1-Display-Bold", size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(.typeface)
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
                .foregroundColor(.card)
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
        //TODO: load pages and text in app rather than webkit view?
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
                            .foregroundColor(.white)
                            .font(.custom("ProximaNova-Medium", size: 15))
                        Text(headline)
                            .font(.custom("Formula1-Display-Bold", size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
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
        //Here is where the webscraping URL and other settings were defined
        
        NavigationView {
            ZStack{
                Color(.backdrop)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    //Top bar with the race countdown
                    HStack{
                        VStack{
                            Text("nextrace")
                                .font(.custom("Formula1-Display-Regular", size: 30))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("SEP 19-20")
                                .font(.custom("Formula1-Display-Regular", size: 12))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Spacer()
                        //TODO: proper countdown
                        Text(Date().addingTimeInterval(600), style: .relative)
                            .font(.custom("Formula1-Display-Regular", size: 24))
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.babyBlue, .purpleBlend, .hotrodPink]), startPoint: .leading, endPoint: .trailing)
                    )
                    //Here is the main part of the homepage
                    ScrollView {
                        VStack{ //i am the main news scroll page
                            ForEach(newsBIG, id: \.id) { newsBIG in
                                //here used to be the webscraping for the headliner variables
                                Headliner (headline: "I am a UI test. Don't I look fabulous?", title: "I am a UI test. Don't I look fabulous?", img: "Image would go here", address: "Address would go here")
                            }
                            
                            ForEach(news, id: \.id) { news in
                                //Here used to be the webscraping for the news variables
                                headline2 (headline: "I am a UI test. Don't I look fabulous?", title: "I am a UI test. Don't I look fabulous?", img: "Image would go here", address: "Address would go here")
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

