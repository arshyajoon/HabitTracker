//
//  Form.swift
//  HabbitTracker
//
//  Created by Arshya GHAVAMI on 2/10/21.
//

import SwiftUI

struct FormView: View {
    @ObservedObject var activities: Activities
    @State private var title = ""
    @State private var description = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
        Form {
            TextField("Enter your activity", text: $title)
            TextField("Enter your description", text: $description)
        }
        .navigationBarItems(trailing: Button(action: {
            let activity = Activity(title: title, description: description)
            activities.activity.append(activity)
            activities.save()
            presentationMode.wrappedValue.dismiss()
            
        }) {
          Text("Save")
        })
        .navigationBarTitle("Add your activity")
        
    }
}
}
//struct Form_Previews: PreviewProvider {
//    static var previews: some View {
//        Form()
//    }
//}
