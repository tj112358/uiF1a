//
//  newStandings.swift
//  app2
//
//  Created by Thea Yocum on 10/15/25.
//
import SwiftUI
import SwiftSoup
let url = URL (string: "https://www.f1academy.com/Racing-Series/Standings/Driver")!
let html = try? String(contentsOf: url, encoding: .utf8)
let document = try! SwiftSoup.parse(html ?? "")

struct Driver: Identifiable {
    let personValue: Int
    let id = UUID()
}

struct NewStandingsPage: View {
    private let drivers = [
        Driver(personValue: 0),
        Driver(personValue: 1),
        Driver(personValue: 2),
        Driver(personValue: 3),
        Driver(personValue: 4),
        Driver(personValue: 5),
        Driver(personValue: 6),
        Driver(personValue: 7),
        Driver(personValue: 8),
        Driver(personValue: 9),
        Driver(personValue: 10),
        Driver(personValue: 11),
        Driver(personValue: 12),
        Driver(personValue: 13),
        Driver(personValue: 14),
        Driver(personValue: 15),
        Driver(personValue: 16),
        Driver(personValue: 17),
        Driver(personValue: 18),
        Driver(personValue: 19),
        Driver(personValue: 20),
        Driver(personValue: 21),
        Driver(personValue: 22),
        Driver(personValue: 23),
        Driver(personValue: 24),
        Driver(personValue: 25),
        Driver(personValue: 26),
        Driver(personValue: 27),
        Driver(personValue: 28),
        Driver(personValue: 29)
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("DRIVERS' STANDINGS")
                        .foregroundStyle(Color(snow))
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
                                .frame(alignment: .trailing)
                        }
                        .font(.custom("ProximaNova-Bold", size: 20))
                            
                        ForEach(drivers, id: \.id) { driver in
                            let standing = try! document.select("tbody tr:eq(\(driver.personValue)) .pos")
                            let pts = try! document.select("tbody tr:eq(\(driver.personValue)) .total-points")
                            let person = try! document.select("tbody tr:eq(\(driver.personValue)) .visible-desktop-up")
                            let abrv = try! document.select("tbody tr:eq(\(driver.personValue)) .visible-desktop-down")
                                
                            GridRow {
                                Text("\(try! standing.text())")
                                    .padding(.leading, 5)
                                    .padding(.trailing, 20)
                                Image("\(try! abrv.text())" + "_headshot")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing, 15)
                                Text("\(try! person.text())")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(try! pts.text())")
                                    .frame(alignment: .trailing)
                            }
                            .font(.custom("Formula1-Display-Regular", size: 14))
                        }
                    }
                }
                .foregroundStyle(Color(snow))
                .font(.custom("ProximaNova-Medium", size: 15))
                .frame(maxWidth: .infinity)
            }
        }
    }
}


#Preview {
    NewStandingsPage()
}
