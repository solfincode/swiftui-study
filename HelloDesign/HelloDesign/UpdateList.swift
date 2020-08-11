//
//  UpdateList.swift
//  HelloDesign
//
//  Created by Q on 2020/08/03.
//  Copyright © 2020 sol. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    func addUpdate(){
        store.updates.append(Update(image:"tree",title:"New item",text:"new text",date:"Feb 2"))
    }
    var body: some View {
        NavigationView{
            List{
                ForEach(store.updates) { update in
                    NavigationLink(destination:
                    UpdateDetail(update:update)){
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:80,height:80)
                                .background(Color.blue)
                                .cornerRadius(20)
                                .padding(.trailing,4)
                            VStack(alignment: .leading, spacing: 8.0){
                                Text(update.title)
                                    .font(.system(size:20,weight:.bold))
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical,8)
                    }
                }
                .onDelete{ index in
                    self.store.updates.remove(at:index.first!)
                }
                .onMove{
                    (source:IndexSet,destination:Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
        .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action:addUpdate){
                Text("add update")
                },trailing: EditButton())
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct Update:Identifiable{
    var id =  UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData=[
    Update(image: "banner", title: "swiftUI", text: "this is awesome tool i love to make experiments and do some make great service with it", date: "Jan 1"),
     Update(image: "banner", title: "swiftUI2", text: "this is awesome tool and try to use and make awesome app", date: "Jan 2"),
      Update(image: "banner", title: "swiftUI3", text: "this is awesome tool and yes this is good tool for ux design for app", date: "Jan 3"),
      
]
