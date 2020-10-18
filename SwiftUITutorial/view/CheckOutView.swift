//
//  CheckOutView.swift
//  SwiftUITutorial
//
//  Created by Mohamed Ben Abdallah on 05/10/2020.
//

import SwiftUI

struct CheckOutView: View {
	
	@EnvironmentObject var order: Order
	
	static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
	@State private var paymentType = 0
	
	@State private var addLoyaltyDetails = false
	@State private var loyaltyNumber = ""
	
	static let tipAmounts = [10, 15, 20, 25, 0]
	@State private var tipAmount = 1
	
    var body: some View {
		Form {
			Section(header: Text("Add a tip?")) {
				Picker("How do you want to pay?", selection: $paymentType) {
					ForEach(Self.paymentTypes, id: \.self) {
						Text($0)
					}
				}
				Toggle(isOn: $addLoyaltyDetails.animation()) {
					Text("Add iDine loyalty card")
				}
				if addLoyaltyDetails {
					TextField("Enter your iDine ID", text: $loyaltyNumber)
				}
			}
			Section(header: Text("Add a tip?")) {
				Picker("Percentage:", selection: $tipAmount) {
					ForEach(0 ..< Self.tipAmounts.count) {
						Text("\(Self.tipAmounts[$0])%")
					}
				}.pickerStyle(SegmentedPickerStyle())
			}
		}
		.navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckOutView_Previews: PreviewProvider {
	
	static let order = Order()
	
    static var previews: some View {
		NavigationView {
			CheckOutView().environmentObject(order)
		}
    }
}
