//
//  ContentView.swift
//  HabbitTracker
//
//  Created by Arshya GHAVAMI on 2/7/21.
//

import SwiftUI

struct Activity: Identifiable, Codable {
    let id = UUID()
    var title: String
    var description: String
}

class Activities: ObservableObject {
   @Published var activity = [Activity]()
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Activities") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: data) {
                self.activity = decoded
                return
            }
        }
        self.activity = []
    }
    func save() {
        if let encoded = try? JSONEncoder().encode(activity) {
            UserDefaults.standard.set(encoded, forKey: "Activities")
        }
    }
}

struct ContentView: View {
   @ObservedObject var activities = Activities()
    @State private var showingSheet = false
    var body: some View {
        NavigationView {
        List(activities.activity, id: \.id) { activity in
            NavigationLink(destination: DetailView(activity: activity)) {
                Text(activity.title)
            }
            
            
        }
        .sheet(isPresented: $showingSheet) {
            FormView(activities: activities)
        }
        .navigationBarItems(leading:  Button(action: {
            self.showingSheet = true
        }){
            Image(systemName: "plus")
        })
        .navigationBarTitle("Activities")
    }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//1. add edit button to content view
//2. create and call a function that deletes rows in our list 


