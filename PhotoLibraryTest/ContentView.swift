//
//  ContentView.swift
//  PhotoLibraryTest
//
//  Created by sako0602 on 2023/08/31.
//

import SwiftUI

struct ImageNameSettingRowView : View {
    
    @Binding var text: String
    @Binding var uiImage: UIImage?
    @State var showingPicker = false
    
    var body: some View {
        GeometryReader { geometry in
            HStack{
                Spacer()
                VStack{
                    if let image = uiImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:  geometry.size.width * 0.3, height: geometry.size.height)
                    } else {
                        Rectangle()
                            .frame(width:  geometry.size.width * 0.3, height: geometry.size.height)
                    }
                }
//                .frame(width:  geometry.size.width * 0.3, height: geometry.size.height)
                
                Spacer()
                VStack{
                    Button("画像表示"){
                        showingPicker = true
                    }
                    TextField("名前入力", text: $text)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: geometry.size.width * 0.5)
                }
                Spacer()
            }
            .sheet(isPresented: $showingPicker) {
                       ImagePickerView(image: $uiImage, sourceType: .library)
                }
        }
    }
}

struct ContentView: View {
    
    @State var text1 = ""
    @State var text2 = ""
    @State var text3 = ""
    @State var text4 = ""
    @State var image1:UIImage?
    @State var image2:UIImage?
    @State var image3:UIImage?
    @State var image4:UIImage?
    
    @State var showingPicker = false
    @State var image: UIImage?
    @State var text = ""
//    @State var imageNameSettingRowViews: [ImageNameSettingRowView]  = [
//        ImageNameSettingRowView(text: Self.$text1),
//        ImageNameSettingRowView(text: Self.$text2),
//        ImageNameSettingRowView(text: Self.$text3),
//        ImageNameSettingRowView(text: Self.$text4)
//    ]
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                Color.green.ignoresSafeArea(.all)
                
                VStack{
                    ImageNameSettingRowView(text: $text1, uiImage: $image1)
                    ImageNameSettingRowView(text: $text2, uiImage: $image2)
                    ImageNameSettingRowView(text: $text3, uiImage: $image3)
                    ImageNameSettingRowView(text: $text4, uiImage: $image4)
                }
//                HStack{
//                    Spacer()
//                    Rectangle()
//                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.19)
//                    Spacer()
//                    TextField("名前入力", text: $text)
//                        .textFieldStyle(.roundedBorder)
//                        .frame(width: geometry.size.width * 0.3)
//                    Spacer()
//                }

            }
        }
       
//        VStack {
//        if let image = image {
//            let _ = print("🍔", image)
//            Image(uiImage: image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
//        } else {
//            Color.blue
//                .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
//        }
//            Text("Image")
//                .onTapGesture {
//                    showingPicker.toggle()
//                }
//        }
//        .sheet(isPresented: $showingPicker) {
//            ImagePickerView(image: $image, sourceType: .library)
//        }
    }
}

//MARK: -

//UIViewControllerRepresentable : ViewControllerを作成・更新・破棄するためにそのメソッドを使用する。
//SwiftUIビューと協調させたい場合、それらの相互作用を促進するためにコーディネーターのインスタンスを提供する必要がある。
struct ImagePickerView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    enum SourceType {
        case camera
        case library
    }
    
    var sourceType: SourceType
    var allowsEditing: Bool = false
        
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let viewController = UIImagePickerController()
        viewController.delegate = context.coordinator
        switch sourceType {
        case .camera:
            viewController.sourceType = UIImagePickerController.SourceType.camera
        case .library:
            viewController.sourceType = UIImagePickerController.SourceType.photoLibrary
        }
        viewController.allowsEditing = allowsEditing
        return viewController
    }

    
    //MARK: -
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerView

        init(_ parent: ImagePickerView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.editedImage] as? UIImage {
                parent.image = image
            } else if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    //MARK: -
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
