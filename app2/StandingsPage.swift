//
//  newStandings.swift
//  app2
//
//  Created by Thea Yocum on 10/15/25.
//
import SwiftUI
import SwiftSoup

struct Driver: Identifiable {
    let personValue: Int
    let name: String
    let id = UUID()
}

struct StandingsPage: View {
    
    private let drivers = [
        Driver(personValue: 0, name: ""),
        Driver(personValue: 1, name: ""),
        Driver(personValue: 2, name: ""),
        Driver(personValue: 3, name: ""),
        Driver(personValue: 4, name: ""),
        Driver(personValue: 5, name: ""),
        Driver(personValue: 6, name: ""),
        Driver(personValue: 7, name: ""),
        Driver(personValue: 8, name: ""),
        Driver(personValue: 9, name: ""),
        Driver(personValue: 10, name: ""),
        Driver(personValue: 11, name: ""),
        Driver(personValue: 12, name: ""),
        Driver(personValue: 13, name: ""),
        Driver(personValue: 14, name: ""),
        Driver(personValue: 15, name: ""),
        Driver(personValue: 16, name: ""),
        Driver(personValue: 17, name: ""),
        Driver(personValue: 18, name: ""),
        Driver(personValue: 19, name: ""),
        Driver(personValue: 20, name: ""),
        Driver(personValue: 21, name: ""),
        Driver(personValue: 22, name: ""),
        Driver(personValue: 23, name: "")
    ]
    
    //TODO: async loading, load only needed when race ends
    
    var body: some View {
        //initializing the first round of scraping would go here
        //        let url = URL (string: "https://www.f1academy.com/Racing-Series/Standings/Driver")!
        //        let html = try? String(contentsOf: url, encoding: .utf8)
        //        let document = try! SwiftSoup.parse(html ?? "")
        
        NavigationView{
            ZStack {
                Color(.backdrop)
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        Text("DRIVERS' STANDINGS")
                            .foregroundStyle(.typeface)
                            .font(.custom("Formula1-Display-Regular", size: 26))
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                        
                        Grid(alignment: .leading, horizontalSpacing: 1, verticalSpacing: 25){
                            GridRow {
                                Text("POS")
                                    .gridCellColumns(2)
                                Text("DRIVER")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("PTS")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .font(.custom("ProximaNova-Bold", size: 20))
                            
                            ForEach(drivers, id: \.id) { driver in
                                
                                //initiailizing the standing, pts, person, and abrv would go here
                                //                            let standing = try! document.select("tbody tr:eq(\(driver.personValue)) .pos")
                                //                            let pts = try! document.select("tbody tr:eq(\(driver.personValue)) .total-points")
                                //                            let person = try! document.select("tbody tr:eq(\(driver.personValue)) .visible-desktop-up")
                                //                            let abrv = try! document.select("tbody tr:eq(\(driver.personValue)) .visible-desktop-down")
                                
                                NavigationLink (destination: DriverView(driver: driver)){
                                    GridRow {
                                        Text("X")
                                            .padding(.leading, 5)
                                            .padding(.trailing, 20)
                                        //TODO: scrape this image??
                                        Image("abrv" + "_headshot")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                            .padding(.trailing, 15)
                                        Text("name")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("pts")
                                            .frame(alignment: .trailing)
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.gray)
                                    }
                                    .font(.custom("Formula1-Display-Regular", size: 14))
                                }
                            }
                        }
                    }
                    .foregroundStyle(.typeface)
                    .font(.custom("ProximaNova-Medium", size: 15))
                    .frame(maxWidth: .infinity)
                }
                .padding(20)
            }
        }
    }
}

//TODO: must match standingsPageEvicerated to make the pages match the driver

struct DriverView: View {
    let driver: Driver
    
    var body: some View {
        //initializing the next round of scraping here
        //        let url = URL (string: "https://www.f1academy.com/Racing-Series/Drivers")!
        //        let html = try? String(contentsOf: url, encoding: .utf8)
        //        let document = try! SwiftSoup.parse(html ?? "")
        
        //initializing firstName, lastName, and number would go here
        //        let firstName = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) .first-name")
        //        let lastName = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) div.last-name span")
        //        let number = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) .driver-carno")
        
        ZStack {
            Color(.backdrop)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack (spacing: 0) { //<-- this (spacing: 0) makes the weird spacing go away 🫠
                    //This is the biopic at the top and the nameing
                    ZStack{
                        GeometryReader { proxy in
                            Image("lastName would pull an image here")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            //TODO: fix magic number
                                .frame(width: proxy.size.width, height: 275) //275
                        }
                        VStack{
                            Spacer()
                            VStack{
                                Text("first name here")
                                    .foregroundColor(.white)
                                    .font(.custom("Formula1-Display-Regular", size: 20))
                                Text("last name here" .uppercased())
                                    .font(.custom("Formula1-Display-Regular", size: 30))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                HStack {
                                    Text("IM")
                                        .font(.custom("Formula1-Display-Regular", size: 40))
                                        .foregroundColor(.white)
                                    Text("##")
                                        .font(.custom("Formula1-Display-Regular", size: 30))
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.top, 163) //TODO: fix this magic number
                            .background(
                                LinearGradient(gradient: Gradient(colors: [.clear, .paleGray]), startPoint: .top, endPoint: .bottom)
                            )
                        }
                    }
                    
                    HStack {
                        Spacer()
                        Text("Statistics")
                        Spacer()
                        Text("Biography")
                        Spacer()
                        Text("Results")
                        Spacer()
                    }
                    .font(.custom("Formula1-Display-Regular", size: 16))
                    .foregroundColor(.typeface)
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(
                        .card)
                    
                    Statistics(driver: driver)
                        .id("Stats")
                    Biography(driver: driver)
                        .id("Bio")
                    Results()
                        .id("Res")
                }
            }
        }
    }
}

struct Statistics: View {
    
    let driver: Driver
    
    var body: some View {
        VStack {
            Text("2025 SEASON")
                .font(.custom("Formula1-Display-Bold", size: 20))
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //TODO: make the padding look more aligned, while not using specific pixel sizes
            Grid(alignment: .leading){
                GridRow {
                    Text("Season Position")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("Season Points")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                GridRow {
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.custom("Formula1-Display-Bold", size: 20))
                GridRow {
                    Text("Team")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("Supported By")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                GridRow {
                    Text("TEAM")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    Text("TEAM")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.custom("Formula1-Display-Bold", size: 15))
                Divider()
                GridRow {
                    Text("Podiums")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("Poles")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                GridRow {
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.custom("Formula1-Display-Bold", size: 20))
                GridRow {
                    Text("R1 Wins")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("R2 Wins")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                GridRow {
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.custom("Formula1-Display-Bold", size: 20))
                GridRow {
                    Text("Top 10s")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("DNFs")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                GridRow {
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    Text("00")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .font(.custom("Formula1-Display-Bold", size: 20))
                Divider()
            }
            
            Text("CAREER STATS")
                .font(.custom("Formula1-Display-Bold", size: 20))
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Grid(alignment: .leading){
                GridRow {
                    Text("Career Points")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("Highest Race Finish")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00 (x00)")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                        .padding(.trailing, 40)
                    
                }
                GridRow {
                    Text("Podiums")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("Poles")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("DNFs")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("Races Entered")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("Seasons Entered")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
                GridRow {
                    Text("Wildcard Entries")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    Text("00")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                }
            }
            .padding(.bottom)
        }
    }
}

struct Biography: View {
    
    let driver: Driver
    
    var body: some View {
        //        let url = URL (string: "https://www.f1academy.com/Racing-Series/Drivers")!
        //        let html = try? String(contentsOf: url, encoding: .utf8)
        //        let document = try! SwiftSoup.parse(html ?? "")
        //
        //        let firstName = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) .first-name")
        //         let lastName = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) div.last-name span")
        //         let number = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) .driver-carno")
        
        Divider()
        Text("BIOGRAPHY")
            .font(.custom("Formula1-Display-Bold", size: 20))
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        
        Grid(alignment: .leading) {
            GridRow {
                Text("Date of Birth")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 5)
                Text("Place of Birth")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            GridRow {
                Text("00/00/00")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 5)
                Text("Hesselt, Belgium")
                    .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .font(.custom("Formula1-Display-Bold", size: 15))
            .padding(.bottom, 5)
        }
        
        Text(
             """
Enamoured by the sights of Formula 1 on a family holiday, Nicole Havrda was inspired to begin her own racing journey and can’t wait to make her own mark on a Grand Prix weekend in 2025.
             
Hailing from Comox, British Columbia, the Canadian started off in karting in 2019. After achieving first place in the Calgary Shootout, she went on to be crowned the Vice Champion in the Junior Rotax Challenge Grand Finals in 2021.

Making her open-wheel debut the following year, Havrda earned two top-five finishes in the Indian Racing League Championship and was the youngest of nine finalists for the Aston Martin GT4 female shootout by The Heart of Racing team. Enjoying further success in 2023, she netted three titles in the Formula Pro USA Winter Series, SFR FA2 and became the first female Formula Pro USA Champion.

Progressing up to the Formula Regional Americas Championship, Havrda put together an impressive rookie campaign, finishing sixth overall with four podium finishes.

Teaming up with F1 ACADEMY Official Partner American Express this season, she’ll be getting behind the wheel of the #2 car operated by Hitech TGR. Away from the racetrack, the 19-year-old keeps up the competitive spirit as a downhill ski racer and a swimmer and was featured in a documentary called “The Car Knows No Difference”, which focuses on women in motorsports.
"""
        ) //bioooo
        .padding(15)
       
        HStack {
            Link("Driver Website", destination: URL(string: "https://nicolehavrda.com/")!)
                .padding(10)
                .background(.hotrodPink)
                .foregroundColor(.white)
                .clipShape(Capsule())
            
            Link(destination: URL(string: "https://www.instagram.com/nicole.havrda?igsh=MWQ5YndmYmxncmN5dQ==")!){
                Image("instaicon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .padding(5)
                    .background(.hotrodPink)
                    .clipShape(Capsule())
            }
            
            Link(destination: URL(string: "https://www.youtube.com/@nicole.havrd")!){
                Image("youtubeicon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .padding(2.5)
                    .background(.hotrodPink)
                    .clipShape(Capsule())
            }
        }
        .padding(.bottom)
    }
}

struct Results: View {
    var body: some View {
        Divider()
        Text("RESULTS")
            .font(.custom("Formula1-Display-Bold", size: 20))
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        
        Grid(alignment: .leading) {
            GridRow {
                Text("Round")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 5)
                Text("Race")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text("POS")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text("PTS")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 10)
            }
            .font(.custom("Formula1-Display-Bold", size: 15))
            .padding(.bottom, 5)
            //TODO: would be a for each around here, to make a row for each result
            GridRow {
                Text("Singapore")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 5)
                Text("X")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text("XX")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text("XX")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 10)
            }
        }
    }
}

#Preview("Main Page") {
    StandingsPage()
}

#Preview("Driver View") {
    DriverView(driver: Driver(personValue: 9, name: ""))
}
