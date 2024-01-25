//
//  TravelJournalApp.swift
//  TravelJournal
//
//  Created by Johanna Lohmus on 1/24/24.
//
import Firebase
import SwiftUI

@main
struct TravelJournalApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        
        WindowGroup {
            
            MainView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
