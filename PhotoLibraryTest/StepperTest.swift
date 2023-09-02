//
//  UIStepper.swift
//  PhotoLibraryTest
//
//  Created by sako0602 on 2023/09/02.
//

import SwiftUI
import UIKit

struct StepperTest: View {
    
    @State private var weight = 50.0
    
    var body: some View {
        Form {
            Section(
                content: { },
                header: {
                Text("体重")
                }
            ) {
                Stepper(value: $weight) {
                    Text("\(weight, specifier: "%.1f") Kg")
                }
            }
        }
    }
}

struct StepperView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    @Binding var weigth: Double
    
    //MARK: -
    func makeUIViewController(context: Context) -> UIViewControllerType  {
        let stepper = UIStepper()
        
        stepper.value = weigth
        stepper.maximumValue = 100
        stepper.minimumValue = 10
        
        let viewController = UIViewController()
        viewController.view.addSubview(stepper)
        
        return viewController
    }
    
    //MARK: -
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    //MARK: -
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
    class Coordinator {
        
        let parent: StepperView
        
        init(parent: StepperView) {
            self.parent = parent
        }
        
        @objc func changeValue(_ sender: UIStepper){
            parent.weigth = sender.value
        }
    }
}

struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
        StepperTest()
    }
}
