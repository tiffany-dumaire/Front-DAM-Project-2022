//
//  CustomIntStepperView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 21/02/2022.
//

import SwiftUI

struct CustomIntStepperView: View {
    @Binding var value: Int
    var step: Int
    
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
            TextField("\(value)", value: $value, format: .number)
                .font(.system(size: 16))
                .foregroundColor(.stepperFontColor)
                .multilineTextAlignment(.center)
            Spacer()
            Divider()
            Spacer()
            Button(action: {
                if self.value >= 0 {
                    self.value += self.step
                }
            }, label: {
                Image(systemName: "cross.circle.fill")
                    .foregroundColor(.green)
            })
        }
    }
}

struct CustomIntStepperView_Previews: PreviewProvider {
    static var previews: some View {
        CustomIntStepperView(value: .constant(1), step: 1)
    }
}
