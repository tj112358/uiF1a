//
//  newStandings.swift
//  app2
//
//  Created by Thea Yocum on 10/15/25.
//
import SwiftUI
import SwiftSoup

struct driver {
    let standing: String
    let pts: String
    let person: String
    let abrv: String
    let histno: String
}

struct Driver {
    let personValue: Int
    let name: String
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
    
    //TODO: this range needs to match the number of drivers competing in the season
    for i in 0...25 {
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

struct StandingsPage: View {
    
    //TODO: for when the season hasn't started, add a "no season yet" error page. OR: display last season (have a button to select which season's results are shown)
    
    var standings: [driver] = getStandings()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Grid(alignment: .leading, horizontalSpacing: 1, verticalSpacing: 25){
                        
                        //TODO: remove the magic numbers on the for each to prevent "index out of range" crashes
                        ForEach(0...25, id: \.self) { i in
                            let standing = standings[i].standing
                            let pts = standings[i].pts
                            let person = standings[i].person
                            let abrv = standings[i].abrv

                            NavigationLink {
                                //This is what the Navigation link displays (the driver page)
                                //TODO: isolate the webscraping happening here...
                                let url = URL (string: "https://www.f1academy.com/Racing-Series/Drivers/\(standings[i].histno)/THISWEBSITEISSOSTUPID")!
                                let html = try? String(contentsOf: url, encoding: .utf8)
                                let document = try! SwiftSoup.parse(html ?? "")
                                let name = "\(try! document.select("div .f1-driver-detail--name").text())"
                                
                                ScrollView {
                                    Text(name)
                                    //TODO: connect driver view
                                    //DriverView(name: <#T##Name#>)
                                }

                            } label: {
                                //This is what the navigation link looks like on the standing's page
                                GridRow {
                                    Text(standing)
                                        .padding(.leading, 5)
                                        .padding(.trailing, 20)
                                    //TODO: scrape headshot image? or create a default value if needed
                                    Image(abrv + "_headshot")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .padding(.trailing, 15)
                                    Text(person)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(pts)
                                        .frame(alignment: .trailing)
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color(.gray))
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

//TODO: must match standingsPageEvicerated to make the pages match the driver

//struct DriverView: View {
//    let driver: Driver
//    
//    var body: some View {
//        //initializing the next round of scraping here
//        //        let url = URL (string: "https://www.f1academy.com/Racing-Series/Drivers")!
//        //        let html = try? String(contentsOf: url, encoding: .utf8)
//        //        let document = try! SwiftSoup.parse(html ?? "")
//        
//        //initializing firstName, lastName, and number would go here
//        //        let firstName = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) .first-name")
//        //        let lastName = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) div.last-name span")
//        //        let number = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) .driver-carno")
//        
//        ZStack {
//            Color(.backdrop)
//                .edgesIgnoringSafeArea(.all)
//            ScrollView {
//                VStack (spacing: 0) { //<-- this (spacing: 0) makes the weird spacing go away 🫠
//                    //This is the biopic at the top and the nameing
//                    ZStack{
//                        GeometryReader { proxy in
//                            Image("lastName would pull an image here")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                            //TODO: fix magic number
//                                .frame(width: proxy.size.width, height: 275) //275
//                        }
//                        VStack{
//                            Spacer()
//                            VStack{
//                                Text("first name here")
//                                    .foregroundColor(.white)
//                                    .font(.custom("Formula1-Display-Regular", size: 20))
//                                Text("last name here" .uppercased())
//                                    .font(.custom("Formula1-Display-Regular", size: 30))
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.white)
//                                    .frame(maxWidth: .infinity)
//                                HStack {
//                                    Text("IM")
//                                        .font(.custom("Formula1-Display-Regular", size: 40))
//                                        .foregroundColor(.white)
//                                    Text("##")
//                                        .font(.custom("Formula1-Display-Regular", size: 30))
//                                        .foregroundColor(.white)
//                                }
//                            }
//                            .padding(.top, 163) //TODO: fix this magic number
//                            .background(
//                                LinearGradient(gradient: Gradient(colors: [.clear, .paleGray]), startPoint: .top, endPoint: .bottom)
//                            )
//                        }
//                    }
//                    
//                    HStack {
//                        Spacer()
//                        Text("Statistics")
//                        Spacer()
//                        Text("Biography")
//                        Spacer()
//                        Text("Results")
//                        Spacer()
//                    }
//                    .font(.custom("Formula1-Display-Regular", size: 16))
//                    .foregroundColor(.typeface)
//                    .frame(maxWidth: .infinity)
//                    .padding(10)
//                    .background(
//                        .card)
//                    
//                    Statistics(driver: driver)
//                        .id("Stats")
//                    Biography(driver: driver)
//                        .id("Bio")
//                    Results()
//                        .id("Res")
//                }
//            }
//        }
//    }
//}
//
//struct Statistics: View {
//    
//    let driver: Driver
//    
//    var body: some View {
//        VStack {
//            Text("2025 SEASON")
//                .font(.custom("Formula1-Display-Bold", size: 20))
//                .padding()
//                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//            //TODO: make the padding look more aligned, while not using specific pixel sizes
//            Grid(alignment: .leading){
//                GridRow {
//                    Text("Season Position")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("Season Points")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                }
//                GridRow {
//                    Text("00")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("00")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                }
//                .font(.custom("Formula1-Display-Bold", size: 20))
//                GridRow {
//                    Text("Team")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("Supported By")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                }
//                GridRow {
//                    Text("TEAM")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                        .padding(.bottom, 5)
//                    Text("TEAM")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                }
//                .font(.custom("Formula1-Display-Bold", size: 15))
//                Divider()
//                GridRow {
//                    Text("Podiums")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("Poles")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                }
//                GridRow {
//                    Text("00")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("00")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                }
//                .font(.custom("Formula1-Display-Bold", size: 20))
//                GridRow {
//                    Text("R1 Wins")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("R2 Wins")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                }
//                GridRow {
//                    Text("00")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("00")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                }
//                .font(.custom("Formula1-Display-Bold", size: 20))
//                GridRow {
//                    Text("Top 10s")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("DNFs")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                }
//                GridRow {
//                    Text("00")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                        .padding(.bottom, 5)
//                    Text("00")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                }
//                .font(.custom("Formula1-Display-Bold", size: 20))
//                Divider()
//            }
//            
//            Text("CAREER STATS")
//                .font(.custom("Formula1-Display-Bold", size: 20))
//                .padding()
//                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//            Grid(alignment: .leading){
//                GridRow {
//                    Text("Career Points")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                    Text("00")
//                        .font(.custom("Formula1-Display-Bold", size: 20))
//                }
//                GridRow {
//                    Text("Highest Race Finish")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("00 (x00)")
//                        .font(.custom("Formula1-Display-Bold", size: 20))
//                        .padding(.trailing, 40)
//                    
//                }
//                GridRow {
//                    Text("Podiums")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("00")
//                        .font(.custom("Formula1-Display-Bold", size: 20))
//                }
//                GridRow {
//                    Text("Poles")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("00")
//                        .font(.custom("Formula1-Display-Bold", size: 20))
//                }
//                GridRow {
//                    Text("DNFs")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("00")
//                        .font(.custom("Formula1-Display-Bold", size: 20))
//                }
//                GridRow {
//                    Text("Races Entered")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("00")
//                        .font(.custom("Formula1-Display-Bold", size: 20))
//                }
//                GridRow {
//                    Text("Seasons Entered")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                    Text("00")
//                        .font(.custom("Formula1-Display-Bold", size: 20))
//                }
//                GridRow {
//                    Text("Wildcard Entries")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 10)
//                        .padding(.top, 5)
//                        .padding(.bottom, 5)
//                    Text("00")
//                        .font(.custom("Formula1-Display-Bold", size: 20))
//                }
//            }
//            .padding(.bottom)
//        }
//    }
//}
//
//struct Biography: View {
//    
//    let driver: Driver
//    
//    var body: some View {
//        //        let url = URL (string: "https://www.f1academy.com/Racing-Series/Drivers")!
//        //        let html = try? String(contentsOf: url, encoding: .utf8)
//        //        let document = try! SwiftSoup.parse(html ?? "")
//        //
//        //        let firstName = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) .first-name")
//        //         let lastName = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) div.last-name span")
//        //         let number = try! document.select("div.row div.teams-driver-item:eq(\(driver.personValue)) .driver-carno")
//        
//        Divider()
//        Text("BIOGRAPHY")
//            .font(.custom("Formula1-Display-Bold", size: 20))
//            .padding()
//            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//        
//        Grid(alignment: .leading) {
//            GridRow {
//                Text("Date of Birth")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 10)
//                    .padding(.top, 5)
//                Text("Place of Birth")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
//            GridRow {
//                Text("00/00/00")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 10)
//                    .padding(.top, 5)
//                Text("Hesselt, Belgium")
//                    .frame(maxWidth: .infinity, alignment: .topLeading)
//            }
//            .font(.custom("Formula1-Display-Bold", size: 15))
//            .padding(.bottom, 5)
//        }
//        
//        Text(
//             """
//Enamoured by the sights of Formula 1 on a family holiday, Nicole Havrda was inspired to begin her own racing journey and can’t wait to make her own mark on a Grand Prix weekend in 2025.
//             
//Hailing from Comox, British Columbia, the Canadian started off in karting in 2019. After achieving first place in the Calgary Shootout, she went on to be crowned the Vice Champion in the Junior Rotax Challenge Grand Finals in 2021.
//
//Making her open-wheel debut the following year, Havrda earned two top-five finishes in the Indian Racing League Championship and was the youngest of nine finalists for the Aston Martin GT4 female shootout by The Heart of Racing team. Enjoying further success in 2023, she netted three titles in the Formula Pro USA Winter Series, SFR FA2 and became the first female Formula Pro USA Champion.
//
//Progressing up to the Formula Regional Americas Championship, Havrda put together an impressive rookie campaign, finishing sixth overall with four podium finishes.
//
//Teaming up with F1 ACADEMY Official Partner American Express this season, she’ll be getting behind the wheel of the #2 car operated by Hitech TGR. Away from the racetrack, the 19-year-old keeps up the competitive spirit as a downhill ski racer and a swimmer and was featured in a documentary called “The Car Knows No Difference”, which focuses on women in motorsports.
//"""
//        ) //bioooo
//        .padding(15)
//       
//        HStack {
//            Link("Driver Website", destination: URL(string: "https://nicolehavrda.com/")!)
//                .padding(10)
//                .background(.hotrodPink)
//                .foregroundColor(.white)
//                .clipShape(Capsule())
//            
//            Link(destination: URL(string: "https://www.instagram.com/nicole.havrda?igsh=MWQ5YndmYmxncmN5dQ==")!){
//                Image("instaicon")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 30, height: 30)
//                    .padding(5)
//                    .background(.hotrodPink)
//                    .clipShape(Capsule())
//            }
//            
//            Link(destination: URL(string: "https://www.youtube.com/@nicole.havrd")!){
//                Image("youtubeicon")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 35, height: 35)
//                    .padding(2.5)
//                    .background(.hotrodPink)
//                    .clipShape(Capsule())
//            }
//        }
//        .padding(.bottom)
//    }
//}
//
//struct Results: View {
//    var body: some View {
//        Divider()
//        Text("RESULTS")
//            .font(.custom("Formula1-Display-Bold", size: 20))
//            .padding()
//            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//        
//        Grid(alignment: .leading) {
//            GridRow {
//                Text("Round")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 10)
//                    .padding(.top, 5)
//                Text("Race")
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                Text("POS")
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                Text("PTS")
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                    .padding(.trailing, 10)
//            }
//            .font(.custom("Formula1-Display-Bold", size: 15))
//            .padding(.bottom, 5)
//            //TODO: would be a for each around here, to make a row for each result
//            GridRow {
//                Text("Singapore")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 10)
//                    .padding(.top, 5)
//                Text("X")
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                Text("XX")
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                Text("XX")
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                    .padding(.trailing, 10)
//            }
//        }
//    }
//}

#Preview("Main Page") {
    StandingsPage()
}

//#Preview("Driver View") {
//    DriverView(driver: Driver(personValue: 9, name: ""))
//}
