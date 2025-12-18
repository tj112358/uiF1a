//
//  ContentView.swift
//  SwiftUIToolbars
//
//  Created by Thea Yocum on 9/10/25.
//



// om nom nom tester


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

//TODO: add colors to asset catalog?? instead of in here
//This is white
var jet = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
//This is white smoke
var olive = UIColor(hue: 0/360, saturation: 2/100, brightness: 95/100, alpha: 1)
//This is off-black
var snow = UIColor(red: 21/255, green: 21/255, blue: 32/255, alpha: 1)
var pink = UIColor(red: 207/255, green: 0/255, blue: 126/255, alpha: 1)
var blue = UIColor(red: 83/255, green: 199/255, blue: 231/255, alpha: 1)
var purple = UIColor(red: 145/255, green: 100/255, blue: 179/255, alpha: 1)
var race = UIColor(hue: 0/360, saturation: 0/100, brightness: 88/100, alpha: 1)
var pinky = UIColor(hue: 323/360, saturation: 45/100, brightness: 91/100, alpha: 1)


//var snow = UIColor(hue: 340/360, saturation: 2/100, brightness: 97/100, alpha: 1)

struct ContentView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                SplashView()
            } else {
                //Rectangle()
                // .background(Color.white)
                Image("loadingAcademy")
                    .resizable()
                    .frame(maxHeight: .infinity)
                    .ignoresSafeArea(edges: .top)
                    .ignoresSafeArea(edges: .bottom)
                    .aspectRatio(contentMode: .fill)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}


struct SplashView: View {
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
            SettingsPage()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .onAppear {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
            UITabBar.appearance().backgroundColor = .white
        }
        
        //TODO: get rid of this, use tint/accent color
        /*.onAppear(perform: {
         UITabBar.appearance().unselectedItemTintColor = .white
         UITabBar.appearance().backgroundColor = .black
         UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.green)]
         UITabBar.appearance().standardAppearance = UITabBarAppearance()
         //UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
         UITabBar.appearance().barTintColor = UIColor(.black)
         })*/
        
        /*.onAppear {
         let appearance = UITabBarAppearance()
         appearance.backgroundColor = UIColor(Color.purple.opacity(0.2))
         appearance.shadowColor = UIColor(.purple)
         appearance.backgroundEffect = UIBlurEffect(style: .extraLight)
         UITabBar.appearance().standardAppearance = appearance
         UITabBar.appearance().scrollEdgeAppearance = appearance
         }*/
    }
}


#Preview {
    ContentView()
}
