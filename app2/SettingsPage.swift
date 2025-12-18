//
//  Settings.swift
//  app2
//
//  Created by Thea Yocum on 9/18/25.
//

import SwiftUI
import WebKit

struct card: View {
    
    var headline: String
    var img: String
    var route: String
    
    var body: some View {
        NavigationLink(destination: WebView(url: URL(string: route))) {
            VStack(alignment: .leading, spacing: 20.0){
                HStack{
                    Image(systemName: img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding(10)
                    VStack(alignment: .leading){
                        Text(headline .uppercased())
                            .font(.custom("Formula1-Display-Regular", size: 16))
                            .foregroundColor(.typeface)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                }
                .background(Rectangle()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(15)
                    .foregroundColor(.card)
                            //.shadow(radius: 15)
                )
                .padding(.top, 5)
                .padding(.horizontal)
            }
        }
    }
}

struct Info {
    let headline: String
    let img: String
    let route: String
    
    //let profile: String
}

struct SettingsPage: View {
    let info = [
        Info(headline: "Official F1Academy Website", img: "globe", route: "https://www.f1academy.com"),
        Info(headline: "Watch Races on Youtube", img: "play.tv", route: "https://www.youtube.com/@f1academy/streams"),
        Info(headline: "Discover Your Drive", img: "car.2.fill", route: "https://www.f1academy.com/Discover-Your-Drive"),
        Info(headline: "Car Specs", img: "car.side", route: "https://www.f1academy.com/About/6zGmsPscfUgxbgTXODCFVB/the-car-and-engine"),
        Info(headline: "Points System Explained", img: "numbers", route: "https://www.fanamp.com/f1-news/how-does-f1-academy-work"),
        Info(headline: "Play Chess", img: "crown", route: "https://www.chess.com"),
        Info(headline: "App Log & Credits", img: "text.document", route: "https://docs.google.com/document/d/1qrKXn8SsONdS8BWXUdm5Qavv7JGQWytzF_7s6QlZ0ZM/edit?usp=sharing"),
        Info(headline: "Help!", img: "questionmark.message", route: "https://www.youtube.com/watch?v=xvFZjo5PgG0&list=RDxvFZjo5PgG0&start_radio=1")
        
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.backdrop)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Text("Settings")
                            .frame(alignment: .leading)
                            .font(.custom("Formula1-Display-Bold", size: 25))
                            .padding(.leading, 10)
                        Spacer()
                    }
                    .padding(10)
                    ScrollView {
                        ForEach(info, id: \.headline) {info in
                            card(headline: "\(info.headline)", img: "\(info.img)", route: "\(info.route)")
                        }
                        /*card(headline: "test", img: "globe", address: "www.google.com")*/
                    }
                }
            }
        }
        
    }
}


#Preview {
    SettingsPage()
}
