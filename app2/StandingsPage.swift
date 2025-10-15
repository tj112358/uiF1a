//
//  Standings.swift
//  app2
//
//  Created by Thea Yocum on 9/18/25.
//

import SwiftUI
import SwiftSoup



struct DriverL: Identifiable {
    let id = UUID()
    let name: String
    let position: Int
    let points: Int
    let headshot: String
    let firstName: String
    let lastName: String
    let number: Int
    let nation: String
    let team: String
    let support: String
    //let profile: String
}


struct StandingsPage: View {
    
    private let driversL = [
        DriverL(name: "N. Havrda", position: 17, points: 1, headshot: "havrda_headshot", firstName: "Nicole", lastName: "Havrda", number: 2, nation: "🇨🇦", team: "Hitech TGR", support: "American Express"),
        DriverL(name: "N. Gademan", position: 6, points: 51, headshot: "gademan_headshot", firstName: "Nina", lastName: "Gademan", number: 3, nation: "🇳🇱", team: "PREMA Racing", support: "Alpine"),
        DriverL(name: "E. Felbermayr", position: 10, points: 22, headshot: "felbermayr_headshot", firstName: "Emma", lastName: "Felbermayr", number: 5, nation: "🇦🇹", team: "Rodin Motorsport", support: "Kick Sauber"),
        DriverL(name: "C. Crone", position: 18, points: 0, headshot: "crone_headshot", firstName: "Courtney", lastName: "Crone", number: 7, nation: "🇺🇸", team: "ART Grand Prix", support: "Haas"),
        DriverL(name: "A. Anagnostiadis", position: 15, points: 5, headshot: "anagnostiadis_headshot", firstName: "Aiva", lastName: "Anagnostiadis", number: 11, nation: "🇦🇺", team: "Hitech TGR", support: "TAG Heuer"),
        DriverL(name: "A. Larsen", position: 7, points: 48, headshot: "larsen_headshot", firstName: "Alba", lastName: "Larsen", number: 12, nation: "🇩🇰", team: "MP Motorsport", support: "Tommy Hilfiger"),
        DriverL(name: "C. Chambers", position: 3, points: 93, headshot: "chambers_headshot", firstName: "Chloe", lastName: "Chambers", number: 14, nation: "🇺🇸", team: "Campos Racing", support: "Red Bull Ford"),
        DriverL(name: "R. Ferreira", position: 11, points: 13, headshot: "ferreira_headshot", firstName: "Rafaela", lastName: "Ferreira", number: 18, nation: "🇧🇷", team: "Campos Racing", support: "Racing Bulls"),
        DriverL(name: "E. Lloyd", position: 4, points: 84, headshot: "lloyd_headshot", firstName: "Ella", lastName: "Lloyd", number: 20, nation: "🇬🇧", team: "Rodin Motorsport", support: "McLaren"),
        DriverL(name: "A. Palmowski", position: 5, points: 73, headshot: "palmowski_headshot", firstName: "Alisha", lastName: "Palmowski", number: 21, nation: "🇬🇧", team: "Campos Racing", support: "Red Bull Racing"),
        DriverL(name: "A. Nobels", position: 14, points: 5, headshot: "nobels_headshot", firstName: "Aurelia", lastName: "Nobels", number: 22, nation: "🇧🇷", team: "ART Grand Prix", support: "Puma"),
        DriverL(name: "J. Ciconte", position: 16, points: 4, headshot: "ciconte_headshot", firstName: "Joanne", lastName: "Ciconte", number: 25, nation: "🇦🇺", team: "MP Motorsport", support: "Wella"),
        DriverL(name: "C. Chong", position: 12, points: 12, headshot: "chong_headshot", firstName: "Chloe", lastName: "Chong", number: 27, nation: "🇬🇧", team: "Rodin Motorsport", support: "Charlotte Tilbury"),
        DriverL(name: "D. Pin", position: 1, points: 127, headshot: "pin_headshot", firstName: "Doriane", lastName: "Pin", number: 28, nation: "🇫🇷", team: "PREMA Racing", support: "Mercedes"),
        DriverL(name: "L. Block", position: 9, points: 23, headshot: "block_headshot", firstName: "Lia", lastName: "Block", number: 57, nation: "🇺🇸", team: "ART Grand Prix", support: "Williams"),
        DriverL(name: "M. Weug", position: 2, points: 107, headshot: "weug_headshot", firstName: "Maya", lastName: "Weug", number: 64, nation: "🇳🇱", team: "MP Motorsport", support: "Scuderia Ferrari"),
        DriverL(name: "T. Hausmann", position: 8, points: 46, headshot: "hausmann_headshot", firstName: "Tina", lastName: "Hausmann", number: 78, nation: "🇨🇭", team: "PREMA Racing", support: "Aston Martin"),
        
        DriverL(name: "M. Bruce", position: 23, points: 0, headshot: "bruce_headshot", firstName: "Megan", lastName: "Bruce", number: 9, nation: "🇬🇧", team: "Hitech TGR", support: "TAG Heuer"),
        
        DriverL(name: "F. AlYousef (WCD)", position: 22, points: 0, headshot: "alyousef_headshot", firstName: "Farah", lastName: "AlYousef", number: 4, nation: "🇸🇦", team: "Hitech TGR", support: "Muhra"),
        DriverL(name: "M. Paatz (WCD)", position: 19, points: 0, headshot: "paatz_headshot", firstName: "Mathilda", lastName: "Paatz", number: 8, nation: "🇩🇪", team: "Hitech TGR", support: "Gatorade"),
        DriverL(name: "W. Shi (WDC)", position: 21, points: 0, headshot: "shi_headshot", firstName: "Wei", lastName: "Shi", number: 24, nation: "🇨🇳", team: "Hitech TGR", support: "Juss Sports"),
        DriverL(name: "L. Billard (WDC)", position: 24, points: 0, headshot: "billard_headshot", firstName: "Lisa", lastName: "Billard", number: 60, nation: "🇫🇷", team: "Hitech TGR", support: "Gatorade"),
        DriverL(name: "E. Kosterman (WCD)", position: 13, points: 6, headshot: "kosterman_headshot", firstName: "Esmee", lastName: "Kosterman", number: 86, nation: "🇳🇱", team: "Hitech TGR", support: "TeamViewer"),
        DriverL(name: "A. Dobson (WDC)", position: 20, points: 0, headshot: "dobson_headshot", firstName: "Ava", lastName: "Dobson", number: 90, nation: "🇺🇸", team: "Hitech TGR", support: "Morgan Stanley")
    ]
    
    var body: some View {
        
        let sortedDriversL = driversL.sorted { $0.position < $1.position}
        
        NavigationView{
                ScrollView{
                    VStack{
                        Text("DRIVERS' STANDINGS")
                            .foregroundStyle(Color(snow))
                            .font(.custom("Formula1-Display-Regular", size: 26))
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                        
                        Grid(alignment: .leading, horizontalSpacing: 1, verticalSpacing: 30){
                            GridRow {
                                Text("POS")
                                    .gridCellColumns(2)
                                Text("DRIVER")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("PTS")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .font(.custom("ProximaNova-Bold", size: 20))
                            
                            ForEach(sortedDriversL, id: \.id) { driverL in
                                NavigationLink (destination: DriverLView(driverL: driverL)){
                                    GridRow{
                                        Text("\(driverL.position)")
                                            .padding(.leading, 5)
                                            .padding(.trailing, 20)
                                        Image("\(driverL.headshot)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                            .padding(.trailing, 15)
                                        Text("\(driverL.name)")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("\(driverL.points)")
                                    }
                                    .font(.custom("Formula1-Display-Regular", size: 14))
                                }
                            }
                        }
                        .foregroundStyle(Color(snow))
                        .font(.custom("ProximaNova-Medium", size: 15))
                        .frame(maxWidth: .infinity)
                    }
                    .padding(20)
                }
            }
        }
    }


struct DriverLView: View {
    
    let driverL: DriverL
    
    var body: some View {
        ScrollView {
            LazyVStack (pinnedViews: .sectionHeaders) {
                VStack{
                    ScrollViewReader { proxy in
                        ZStack{
                            GeometryReader {proxy in
                                Image("\(driverL.lastName)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.size.width, height: 275) //275
                            }
                            VStack{
                                Spacer()
                                VStack{
                                    Text("\(driverL.firstName)")
                                        .foregroundColor(Color(jet))
                                        .font(.custom("Formula1-Display-Regular", size: 20))
                                    Text("\(driverL.lastName)" .uppercased())
                                        .font(.custom("Formula1-Display-Regular", size: 30))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(jet))
                                        .frame(maxWidth: .infinity)
                                    HStack {
                                        Text("\(driverL.nation)")
                                            .font(.custom("Formula1-Display-Regular", size: 40))
                                            .foregroundColor(Color(snow))
                                        Text("\(driverL.number)")
                                            .font(.custom("Formula1-Display-Regular", size: 30))
                                            .foregroundColor(Color(jet))
                                    }
                                }
                                .padding(.top, 163)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 41/255, green: 42/255, blue: 39/255, alpha: 0)), Color(UIColor(red: 41/255, green: 42/255, blue: 39/255, alpha: 0.70))]), startPoint: .top, endPoint: .bottom)
                                )
                            }
                        }
                        
                        HStack {
                         Button("Statistics") {
                         proxy.scrollTo("Stats", anchor: .top)
                         }
                         Button("Biography") {
                         proxy.scrollTo("Bio", anchor: .top)
                         }
                         .padding(.leading, 15)
                         .padding(.trailing, 15)
                         Button("Results") {
                         proxy.scrollTo("Res", anchor: .top)
                         }
                         .padding(10)
                         }
                         .font(.custom("Formula1-Display-Regular", size: 16))
                         .foregroundColor(Color(snow))
                         .frame(maxWidth: .infinity)
                         .background(
                         Color(olive)
                         )
                        
                        /*Section (header: Bar(driver: driver)){
                         Statistics(driver: driver)
                         .id("Stats")
                         Biography()
                         .id("Bio")
                         Results()
                         .id("Res")
                         }*/
                        
                        
                        //Bar(driver: driver)
                        
                        Statistics(driverL: driverL)
                            .id("Stats")
                        Biography()
                            .id("Bio")
                        Results()
                            .id("Res")
                   
                    }
                }
            }
        }
    }
}

struct Bar: View {
    
    let driverL: DriverL
    
    var body: some View {
        ScrollViewReader { proxy in
            HStack {
                Button("Statistics") {
                    proxy.scrollTo("Stats", anchor: .top)
                }
                Button("Biography") {
                    proxy.scrollTo("Bio", anchor: .top)
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                Button("Results") {
                    proxy.scrollTo("Res", anchor: .top)
                }
                .padding(10)
            }
            .font(.custom("Formula1-Display-Regular", size: 16))
            .foregroundColor(Color(snow))
            .frame(maxWidth: .infinity)
            .background(
                Color(olive)
            )
        }
    }
}

struct Statistics: View {
    
    let driverL: DriverL

    var body: some View {
        VStack {
            Text("2025 SEASON")
                .font(.custom("Formula1-Display-Bold", size: 20))
                .padding(10)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
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
                    Text("\(driverL.position)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                    Text("\(driverL.points)")
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
                    Text("\(driverL.team)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    Text("\(driverL.support)")
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
                .padding(10)
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
        }
    }
}

struct Biography: View {
    var body: some View {
        Divider()
        Text("BIOGRAPHY")
            .font(.custom("Formula1-Display-Bold", size: 20))
            .padding(10)
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
        Divider()
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
                .background(Color(pink))
                .foregroundColor(.white)
                .clipShape(Capsule())
            
            Link(destination: URL(string: "https://www.instagram.com/nicole.havrda?igsh=MWQ5YndmYmxncmN5dQ==")!){
                Image("instaicon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .padding(5)
                    .background(Color(pink))
                    .clipShape(Capsule())
            }
            
            Link(destination: URL(string: "https://www.youtube.com/@nicole.havrd")!){
                Image("youtubeicon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .padding(2.5)
                    .background(Color(pink))
                    .clipShape(Capsule())
            }
        }
    }
}

struct Results: View {
    var body: some View {
        Text("hello, world!")
    }
}

#Preview {
    StandingsPage()
}
