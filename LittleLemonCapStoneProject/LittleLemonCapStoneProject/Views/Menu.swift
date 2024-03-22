//
//  Menu.swift
//  LittleLemonCapStoneProject
//
//  Created by Muhammad Ali on 22/03/2024.
//

import Foundation
import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    
    @State var searchText = ""
    
    @State var loaded = false
    
    @State var isKeyboardVisible = false
    
    init() {
        UITextField.appearance().clearButtonMode = .whileEditing
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    if !isKeyboardVisible {
                        withAnimation() {
                            Hero()
                                .frame(maxHeight: 180)
                        }
                    }
                    TextField("Search menu", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                .background(Color.primaryColor1)
                
                Text("ORDER FOR DELIVERY!")
                    .font(.sectionTitle())
                    .foregroundColor(.highlightColor2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        Toggle("Starters", isOn: $startersIsEnabled)
                        Toggle("Mains", isOn: $mainsIsEnabled)
                        Toggle("Desserts", isOn: $dessertsIsEnabled)
                        Toggle("Drinks", isOn: $drinksIsEnabled)
                    }
                    .toggleStyle(MyToggleStyle())
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            if !loaded {
               
                loaded = true
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = true
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = false
            }
        }
    }
   
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
