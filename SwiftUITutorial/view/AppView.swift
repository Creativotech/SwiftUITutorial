//
//  AppView.swift
//  SwiftUITutorial
//
//  Created by Mohamed Ben Abdallah on 04/10/2020.
//

import SwiftUI

struct AppView: View {
	var body: some View {
		TabView {
			ContentView()
				.tabItem {
					Image(systemName: "list.dash")
					Text("Menu")
				}
			
			OrderView()
				.tabItem {
					Image(systemName: "square.and.pencil")
					Text("Order")
				}
		}
	}
}

struct AppView_Previews: PreviewProvider {
	static let order = Order()
    static var previews: some View {
		AppView().environmentObject(order)
    }
}
