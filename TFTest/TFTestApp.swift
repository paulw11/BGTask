//
//  TFTestApp.swift
//  TFTest
//
//  Created by Paul Wilkinson on 16/1/2024.
//

import SwiftUI
import BackgroundTasks

@main
struct TFTestApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    let x = BGTaskScheduler.Error.Code.notPermitted
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        BGTaskScheduler.shared.register(
            forTaskWithIdentifier: "simpleTask",
            using: nil
        ) { task in
            if let task = task as? BGProcessingTask {
                print("Run task")
                task.setTaskCompleted(success:true)
            }
        }
        let request = BGProcessingTaskRequest(
            identifier: "simpleTask"
        )
        
        do {
            try BGTaskScheduler.shared.submit(request)
            print("Submitted")
        } catch {
            print(error)
        }
        
        return true
        
    }
}
