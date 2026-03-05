//
//  app2App.swift
//  app2
//
//  Created by Thea Yocum on 9/12/25.
//

import SwiftUI
import SwiftData



@main
struct app2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(queen: [Queen(standing: "", pts: "", person: "", abrv: "", histno: "", firstName: "", lastName: "", image: "", flag: "", carno: "")])
                .modelContainer(for: Queen.self)
        }
    }
    //find simulator data here!
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
