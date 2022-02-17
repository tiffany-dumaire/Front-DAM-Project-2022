//
//  CustomStepperView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 17/02/2022.
//

import SwiftUI

struct CustomDoubleStepperView: View {
    @Binding var value: Double
    var step: Double
    var decimal: Int
    
    var body: some View {
        HStack {
            Button(action: {
                if self.value > 0 {
                    self.value -= self.step
                }
            }, label: {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(value > 0 ? .red : .myGray)
            })
            Spacer()
            Divider()
            Spacer()
            Text(String(format: "%.\(decimal)f", value))
                .font(.system(size: 16))
                .foregroundColor(.stepperFontColor)
            Spacer()
            Divider()
            Spacer()
            Button(action: {
                if self.value > 0 {
                    self.value += self.step
                }
            }, label: {
                Image(systemName: "cross.circle.fill")
                    .foregroundColor(.green)
            })
        }
    }
}

struct CustomDoubleStepperView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDoubleStepperView(value: .constant(1.0), step: 0.1, decimal: 2)
    }
}
