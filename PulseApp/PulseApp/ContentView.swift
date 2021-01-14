//
//  ContentView.swift
//  PulseApp
//
//  Created by Hiram Castro on 1/13/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

var tabs = ["Chats","Status","Calls"]

struct Home: View {
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var selectedTab = "Chats"
    @Namespace var animation
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "camera")
                                .font(.system(size: 22))
                        }
                        Spacer(minLength: 0)
                        Button(action: {
                            
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 22))
                        }
                    }
                    
                    Text("ModyChat")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding()
                //.padding(.top, 20)
                .foregroundColor(.white)
                
                HStack(spacing: 20) {
                    ForEach(tabs,id: \.self) { title in
                        
                    }
                }
                
            }
            
        }
        
    }
}

struct TabButton: View {
    
    @Binding var selectedTab:String
    var title:String
    var animation:Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation {
                selectedTab = title
            }
        }, label: {
            Text(title)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(
                    ZStack {
                        if selectedTab == title {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("top"))
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
        })
    }
    
}

struct CustomerCorner: Shape {
    var corner:UIRectCorner
    var size:CGFloat
    
    func path(in rect:CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: size, height: size))
        
        return Path(path.cgPath)
    }
}

struct ChatView:View {
    
    var chatData:Chat
    
    var body: some View {
        
        HStack(spacing: 10) {
            Image(chatData.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(chatData.name)
                    .fontWeight(.bold)
                    .lineLimit(1)
            })
            
            Spacer(minLength: 0)
            
            Text(chatData.time)
                .font(.system(size: 15))
                .fontWeight(.bold)
        }
        .padding(.horizontal)
        
    }
    
}

struct Chat: Identifiable {
    var id = UUID().uuidString
    var name:String
    var image:String
    var msg:String
    var time:String
}

struct HomeData {
    var groupName:String
    var groupData:[Chat]
}

var FriendsChat:[Chat] = [
    Chat(name: "iJustine",image: "p0", msg: "Hey EveryOne !!!", time: "02:45"),
    Chat(name: "Kavsoft",image: "p1", msg: "Learn - Develop - Deploy", time: "03:45"),
    Chat(name: "SwiftUI",image: "p2", msg: "New Framework For iOS", time: "04:55"),
    Chat(name: "Bill Gates",image: "p3", msg: "Founder Of Microsoft", time: "06:25"),
    Chat(name: "Tim Cook",image: "p4", msg: "Apple lnc CEO", time: "07:19"),
    Chat(name: "Jeff",image: "p5", msg: "I dont Know How To Spend Money :)))", time: "08:22"),
]

var GroupChat : [Chat] = [

    Chat(name: "iTeam",image: "p0", msg: "Hey EveryOne !!!", time: "02:45"),
    Chat(name: "Kavsoft - Developers",image: "p1", msg: "Next Video :))))", time: "03:45"),
    Chat(name: "SwiftUI - Community",image: "p2", msg: "New File Importer/Exporter", time: "04:55"),
]

var data = [

    // Group 1
    HomeData(groupName: "Friends", groupData: FriendsChat),
    // Group 2
    HomeData(groupName: "Group Message", groupData: GroupChat)
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
