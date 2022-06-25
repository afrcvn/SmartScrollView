//
//  ContentView.swift
//  SmartScrollView
//
//  Created by Samba Diawara on 2022-06-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        SmartScrollView{
            VStack {
                ForEach(1...200, id: \.self){ i in
                    HStack{
                        Text("item \(i)")
                        Spacer()
                        Image(systemName: "doc.text.image")
                        Image(systemName: "doc.text.image")
                        Image(systemName: "doc.text.image")
                        Image(systemName: "doc.text.image")
                        Image(systemName: "doc.text.image")
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            .padding(.horizontal)
            .background(.red)
        }
        .background(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
