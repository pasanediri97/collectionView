//
//  ContentView.swift
//  collectionView
//
//  Created by Pasan Induwara Edirisooriya on 2/16/21.
//

import SwiftUI

struct DataModel: Identifiable {
    let id: String
    let name: String
    let imageName: String
}
struct ContentView: View {
    
    let data: [DataModel] = [
        .init(id: "0", name: "Sample 01", imageName: "sample"),
        .init(id: "1", name: "Sample 02", imageName: "sample"),
        .init(id: "2", name: "Sample 03", imageName: "sample"),
        .init(id: "3", name: "Sample 04", imageName: "sample")
    ]
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(data) { items in
                        NavigationLink(destination: Text(items.name)) {
                            
                            CollectionView(data: items)
                        }
                    }
                }
            }
        }
    }
}

struct CollectionView: View {
    let data: DataModel
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(self.data.imageName)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.yellow)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                Spacer()
                
            }
            HStack{
                Text(data.name)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
    }
}
