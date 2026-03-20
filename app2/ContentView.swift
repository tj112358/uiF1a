//
//  ContentView.swift
//  SwiftUIToolbars
//
//  Created by Thea Yocum on 9/10/25.
//


//TODO: better support of 18.6
//TODO: need other language support
//TODO: need support of accesibility font sizes
//TODO: add watch page w youtube API
//TODO: less "magic numbers": declare the scraped variables higher up and store them so they don't have to be scraped every time?
//TODO: add more liquid glass features...

import SwiftUI
import SwiftData
import SwiftSoup

//struct for the driver array that is returned
struct driver: Identifiable {
    let id = UUID()
    let standing: String
    let pts: String
    let person: String
    let abrv: String
    let histno: String
}

//struct for the driver page data array that is returned
struct stalkerData {
    let firstName: String
    let lastName: String
    let image: String
    let flag: String
    let carno: String
}

//struct for the girlypop array
struct Driver {
    let personValue: Int
    let name: String
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    var seasonTotalDrivers = 18
    @State var queen: [Queen]
    @State var standing = ""
    @State var pts = ""
    @State var person = ""
    @State var abrv = ""
    @State var histno = ""
    @AppStorage("userOnboarded", store: .standard) var userOnboarded: Bool = false
    @State var buttonClicked = false
    
    //TODO: for when the season hasn't started, add a "no season yet" error page. OR: display last season (have a button to select which season's results are shown)
    
    var body: some View {
        if userOnboarded {
            TabView{
                NewsPage()
                    .tabItem {
                        Label("News", systemImage: "house.fill")
                    }
                SchedulePage()
                    .tabItem {
                        Label("Schedule", systemImage: "calendar")
                    }
                StandingsPage()
                    .tabItem {
                        Label("Standings", systemImage: "flag.pattern.checkered.2.crossed")
                    }
                WatchPage()
                    .tabItem{
                        Label("Watch", systemImage: "play")
                    }
                SettingsPage()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
            }
        } else {
            ZStack {
                Color(.backdrop)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    if buttonClicked {
                        ProgressView()
                    }
                    Spacer()
                    Text("Welcome to the app! Press the button to run initial setup and enter the app")
                        .font(.custom("Formula1-Display-Bold", size: 20))
                        .foregroundColor(.typeface)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    Button(action : {
                        buttonClicked.toggle()
                        
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
                            Driver(personValue: 59, name: "WES"), //Payton Westcott (WCD)
                            Driver(personValue: 60, name: "PAA"), //Mathilda Paatz
                            Driver(personValue: 61, name: "COU"), //Kaylee Countryman
                            Driver(personValue: 62, name: "BIL"), //Lisa Billard
                            Driver(personValue: 63, name: ""), //Jade Jacquet JAC
                            Driver(personValue: 64, name: "STE"), //Ella Stevens
                            Driver(personValue: 65, name: ""), //* Driver 17 TBA
                            Driver(personValue: 66, name: "KOS"), //Esmee Kosterman
                            Driver(personValue: 67, name: "DOB"), //Ava Dobson
                            Driver(personValue: 68, name: "WES"), //Payton Westcott
                            Driver(personValue: 69, name: "GRA"), //Natalia Granada
                            Driver(personValue: 70, name: ""), //
                            Driver(personValue: 71, name: "") //
                        ]
                        
                        var drivers = [driver]()
                        var stalkerDataSet = [stalkerData]()
                        
                        for i in 0...seasonTotalDrivers-1 {
                            var url = URL (string: "https://www.f1academy.com/Racing-Series/Standings/Driver?seasonId=4")!
                            var html = try? String(contentsOf: url, encoding: .utf8)
                            var document = try! SwiftSoup.parse(html ?? "")
                            
                            let scrapedStanding = try! document.select("tbody tr:eq(\(i)) .pos")
                            let scrapedPts = try! document.select("tbody tr:eq(\(i)) .total-points")
                            let scrapedPerson = try! document.select("tbody tr:eq(\(i)) .visible-desktop-up")
                            let scrapedAbrv = try! document.select("tbody tr:eq(\(i)) .visible-desktop-down")
                            let scrapedAbrvText = try! scrapedAbrv.text()
                            let scrapedHistno = "\(girlypop.last {$0.name == scrapedAbrvText}?.personValue, default: "1000")"
                            
                            drivers.append(driver(standing: "\(try! scrapedStanding.text())", pts: "\(try! scrapedPts.text())", person: "\(try! scrapedPerson.text())", abrv: "\(try! scrapedAbrv.text())", histno: "\(scrapedHistno)"))
                            
                            //handle if the abrv wasn't found in the array, and the default histno = 1000 was used (otherwise, will recieve fatal error: index out of range when trying to scrape values from a non-existant driver page)
                            //TODO: handle if the most recent abrv isn't found, but a diff driver has an old abrv matches (eg: if "histno = 69; abrv: GRA; driver: Natalia Granada" isn't updated, scrapedHistno will pull "histno = 30; abrv: GRA; driver: Chloe Grant"
                            if scrapedHistno == "1000" {
                                let firstName = "Uh Oh.."
                                let lastName = "No Data Found"
                                let imageNew = ""
                                let flagNew = ""
                                let carno = "##"
                                
                                stalkerDataSet.append(stalkerData(firstName: String(firstName), lastName: String(lastName), image: imageNew, flag: flagNew, carno: carno))
                            } else {
                                url = URL (string: "https://www.f1academy.com/Racing-Series/Drivers/\(scrapedHistno)/THISWEBSITEISSOSTUPID")!
                                html = try? String(contentsOf: url, encoding: .utf8)
                                document = try! SwiftSoup.parse(html ?? "")
                                
                                let name = "\(try! document.select("div .f1-driver-detail--name").text())"
                                
                                let names = name.split(separator: " ")
                                let firstName = names[0]
                                let lastName = names[1]
                                
                                let image = try! document.select("div .f1-image--wrapper img")
                                let imageNew = "\(try! image.attr("data-src"))"
                                
                                let flag = try! document.select("div .common-driver-info--flag img")
                                let flagNew = "\(try! flag.attr("data-src"))"
                                
                                let carno = "\(try! document.select("div .common-driver-info--carnumber").text())"
                                
                                stalkerDataSet.append(stalkerData(firstName: String(firstName), lastName: String(lastName), image: imageNew, flag: flagNew, carno: carno))
                            }
                            
                            queen.insert(Queen(standing: drivers[i].standing, pts: drivers[i].pts, person: drivers[i].person, abrv: drivers[i].abrv, histno: drivers[i].histno, firstName: stalkerDataSet[i].firstName, lastName: stalkerDataSet[i].lastName, image: stalkerDataSet[i].image, flag: stalkerDataSet[i].flag, carno: stalkerDataSet[i].carno), at: i)
                            
                            
                            modelContext.insert(queen[i])
                            guard let _ = try? modelContext.save() else {
                                print("Saving data no worky :(")
                                return
                            }
                        }
                        
                        userOnboarded.toggle()
                    }) {
                        Text("Let's Go!")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview("Light Mode") {
    ContentView(queen: [Queen(standing: "", pts: "", person: "", abrv: "", histno: "", firstName: "", lastName: "", image: "", flag: "", carno: "")])
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView(queen: [Queen(standing: "", pts: "", person: "", abrv: "", histno: "", firstName: "", lastName: "", image: "", flag: "", carno: "")])
        .preferredColorScheme(.dark)
}
