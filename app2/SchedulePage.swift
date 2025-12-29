//
//  SchedulePage.swift
//  app2
//
//  Created by Thea Yocum on 9/18/25.
//
import SwiftUI
import SwiftSoup

struct Race: Identifiable {
    let raceValue: Int
    let id = UUID()
}

struct SchedulePage: View {
    
    private let race = [
        Race(raceValue: 15),
        Race(raceValue: 16),
        Race(raceValue: 17),
        Race(raceValue: 18),
        Race(raceValue: 19),
        Race(raceValue: 20),
        Race(raceValue: 21)
    ]
    
    //TODO: asynch loading of this, only needed after a race completes
    var body: some View {
        ZStack {
            Color(.backdrop)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                ActiveEvent(roundNumber: "Round Number here", date: "date here", raceTitle: "Round Name")
                ForEach(race, id: \.id) { race in
                    //initializing the webscraping would go here
                    
                    //webscraping for the event info would go here
                    InActiveEvent(date: "Date here", location: "Location here", raceTitle: "Round name", img: "Image would go here")
                }
            }
        }
    }
}
//TODO: make the current race be the activeEvent card
//TODO: have the past races have their standings update
//TODO: scroll to the active event

struct ActiveEvent: View {
    var roundNumber: String
    var date: String
    var raceTitle: String
    
    var body: some View {
        VStack {
            HStack {
                Text(roundNumber .uppercased())
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(date .uppercased())
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            Text(raceTitle)
                .font(.custom("Formula1-Display-Bold", size: 20))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
            Text("Race 1" .uppercased())
                .font(.system(size: 12))
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                GeometryReader { proxy in
                    Image("arch") //need geometry reader here
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: proxy.size.width, height: proxy.size.height) //275
                }
                .frame(width: 10, height: 25)
                
                VStack{
                    Text("VER")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("00:00.000")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 3)
                GeometryReader { proxy in
                    Image("arch") //need geometry reader here
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: proxy.size.width, height: proxy.size.height) //275
                }
                .frame(width: 10, height: 25)
                
                VStack{
                    Text("VER")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("00:00.000")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 3)
                GeometryReader { proxy in
                    Image("arch") //need geometry reader here
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: proxy.size.width, height: proxy.size.height) //275
                }
                .frame(width: 10, height: 25)
                
                VStack{
                    Text("VER")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("00:00.000")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 3)
            }
            .padding(10)
            .padding(.leading, 3)
            .background(Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity)
                .cornerRadius(15)
                .foregroundColor(.race)
            )
            Text("Race 2" .uppercased())
                .font(.system(size: 12))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 0.5)
            HStack {
                GeometryReader { proxy in
                    Image("arch") //need geometry reader here
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: proxy.size.width, height: proxy.size.height) //275
                }
                .frame(width: 10, height: 25)
                
                VStack{
                    Text("VER")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("00:00.000")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 3)
                GeometryReader { proxy in
                    Image("arch") //need geometry reader here
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: proxy.size.width, height: proxy.size.height) //275
                }
                .frame(width: 10, height: 25)
                
                VStack{
                    Text("VER")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("00:00.000")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 3)
                GeometryReader { proxy in
                    Image("arch") //need geometry reader here
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: proxy.size.width, height: proxy.size.height) //275
                }
                .frame(width: 10, height: 25)
                
                VStack{
                    Text("VER")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("00:00.000")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 3)
            }
            .padding(10)
            .padding(.leading, 3)
            .background(Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity)
                .cornerRadius(15)
                .foregroundColor(.race)
            )
        }
        .padding()
        .background(Rectangle()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(15)
            .foregroundColor(.card)
        )
        .padding(.leading)
        .padding(.trailing)
        .padding(.top, 5)
    }
}

struct InActiveEvent: View {
    var date: String
    var location: String
    var raceTitle: String
    var img: String
    
    var body: some View {
        HStack {
            VStack {
                Text(raceTitle)
                    .font(.custom("Formula1-Display-Bold", size: 20))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
                Text(location)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(date)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Image(uiImage: img.load())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 90, height: 90)
                .padding(.trailing, 30)
        }
        .padding()
        .background(Rectangle()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(15)
            .foregroundStyle(.card)
            )
        
        .padding(.leading)
        .padding(.trailing)
        .padding(.top, 5)
    }
}

#Preview {
    SchedulePage()
}
