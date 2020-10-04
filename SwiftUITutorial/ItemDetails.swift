//
//  ItemDetails.swift
//  SwiftUITutorial
//
//  Created by Mohamed Ben Abdallah on 04/10/2020.
//

import SwiftUI

struct ItemDetails: View {
	
	var item: MenuItem
	
	@EnvironmentObject var order: Order
		
	var body: some View {
		VStack {
			ZStack(alignment: .bottomTrailing) {
				Image(item.mainImage)
				Text("Photo: \(item.photoCredit)")
					.padding(4)
					.background(Color.black)
					.font(.caption)
					.foregroundColor(.white)
					.offset(x: -5, y: -5)
			}
			Text(item.description)
				.padding()
			Button("Order This") {
				self.order.add(item: self.item)
			}.font(.headline)
			Spacer()
		}
		.navigationBarTitle(Text(item.name), displayMode: .inline)
	}
}

struct ItemDetails_Previews: PreviewProvider {
	static let order = Order()
    static var previews: some View {
		NavigationView {
			ItemDetails(item: MenuItem.example).environmentObject(order)
		}
    }
}
