//
//  ContentView.swift
//  SwiftUIToolbars
//
//  Created by Thea Yocum on 9/10/25.
//


//TODO: better support of 18.6
//TODO: add dark mode capabilities
//TODO: need other language support
//TODO: need support of accesibility font sizes
//TODO: add watch page w youtube API
//TODO: less "magic numbers": declare the scraped variables higher up and store them so they don't have to be scraped every time?

import SwiftUI

//TODO: Switch this over to the prof g way of making a loading screen

extension String {
    func load() -> UIImage {
        
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        return UIImage()
    }
}

struct ContentView: View {
    var body: some View {
        TabView{
            NewsPage()
                .tabItem {
                    Label("News", systemImage: "house.fill")
                }
            SchedulePage()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }
            NewStandingsPage()
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
            //TODO: add "watch" page where the races can be watched on
        }
    }
}


#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
