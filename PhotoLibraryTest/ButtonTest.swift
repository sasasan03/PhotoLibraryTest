//
//  ButtonTest.swift
//  PhotoLibraryTest
//
//  Created by sako0602 on 2023/09/03.
//

import SwiftUI
import UIKit

struct ButtonTest: View {
    
    @State private var name: String = "sako"
    
    var body: some View {
        VStack{
            Text("Hello, \(name)")
            MyButton(name: $name)
                 .frame(width: 200,height: 50)
                 .background(Color.purple)
        }
    }
}

struct MyButton: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    @Binding var name: String
    
    //Viewの構築を行う
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let button = UIButton()
        button.setTitle("推して", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.addTarget(context.coordinator, action: #selector(Coordinator.changeName(_:)), for: .touchUpInside)
        
        let viewController = UIViewController()
        viewController.view.addSubview(button)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {  }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator {
        var parent: MyButton
        
        init(parent: MyButton) {
            self.parent = parent
        }
        
        @objc func changeName(_ sender: UIButton){
            parent.name = "hiro"
        }
    }
}

struct ButtonTest_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTest()
    }
}
