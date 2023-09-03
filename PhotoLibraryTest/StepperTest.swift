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
        VStack{
            Text("体重\(weight, specifier: "%.1f")kg")
            
            StepperView(weigth: $weight)
                .frame(width: 100, height: 50)
            
        }
//        Form {
//            Section(
//                content: { },
//                header: {
//                Text("体重")
//                }
//            ) {
//                Stepper(value: $weight) {
//                    Text("\(weight, specifier: "%.1f") Kg")
//                }
//            }
//        }
    }
}

struct StepperView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    @Binding var weigth: Double
    
    //MARK: -
    func makeUIViewController(context: Context) -> UIViewControllerType  {
        let stepper = UIStepper()
        //🍟
        stepper.addTarget(context.coordinator, action: #selector(Coordinator.changeValue(_:)), for: .valueChanged)
        
        stepper.value = weigth
//        stepper.maximumValue = 60
//        stepper.minimumValue = 45
        stepper.autorepeat = true
        
        let viewController = UIViewController()
        viewController.view.addSubview(stepper)
        return viewController
    }
    
    //MARK: - ここでも制限をかけることは可能
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        if let stepper = uiViewController.view.subviews.first as? UIStepper {
//            var newValue = weigth
//            if newValue > 55 {
//                newValue = 55
//            } else if newValue < 45 {
//                newValue = 45
//            }
//            stepper.value = newValue
//        }
    }
    
    //MARK: -
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator {
        
        let parent: StepperView
        
        init(parent: StepperView) {
            self.parent = parent
        }
        
        //ここでも上限をかけることは可能。上のstepperのプロパティへの代入でも可能
        @objc func changeValue(_ sender: UIStepper){
            var newValue = sender.value
            if newValue > 60 {
                newValue = 60
            } else if newValue < 45 {
                newValue = 45
            }
            parent.weigth = newValue
        }
    }
}

struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
        StepperTest()
    }
}
