//
//  DetailView.swift
//  HabbitTracker
//
//  Created by Arshya GHAVAMI on 2/11/21.
//

import SwiftUI

struct DetailView: View {
    var activity: Activity
    var body: some View {
        Text(activity.description)
            .navigationBarTitle(activity.title)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
