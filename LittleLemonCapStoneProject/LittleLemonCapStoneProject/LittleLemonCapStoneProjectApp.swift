//
//  LittleLemonCapStoneProjectApp.swift
//  LittleLemonCapStoneProject
//
//  Created by Muhammad Ali on 22/03/2024.
//

import SwiftUI

@main
struct LittleLemonCapStoneProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
