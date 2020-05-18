//
//  CheckOutView.swift
//  FirstProject
//
//  Created by gomodo on 17/05/20.
//  Copyright © 2020 soultanmuh. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    
    @EnvironmentObject var order: Order
    @State private var paymentType = 0
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    static let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    @State private var pickupTime = 0
    static let pickupTimes = ["Now", "Tonight", "Tomorrow"]
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker(selection: $paymentType, label: Text("How do you want to pay?")) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine loyalty card")
                }
                if (addLoyaltyDetails) {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            Section {
                Picker("Pickup time", selection: $pickupTime) {
                    ForEach(0 ..< Self.pickupTimes.count) {
                        Text("\(Self.pickupTimes[$0])")
                    }
                }
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header:
                Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                    .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") – thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var order = Order()
    
    static var previews: some View {
        NavigationView {
            CheckOutView().environmentObject(order)
        }
    }
}
