//
//  Home.swift
//  LittleLemonCapStoneProject
//
//  Created by Muhammad Ali on 22/03/2024.
//

import Foundation
import SwiftUI

struct Home: View {
    
    var body: some View {
        MainScreen()
            .navigationBarBackButtonHidden()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
