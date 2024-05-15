//
//  ContentView.swift
//  Memorize
//
//  Created by Ufuk Acar on 14.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            let emojis: [String] = [ "👻","🎃","🧙🏼","🐈‍⬛","😈"]
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content:emojis[index])
            }
        }
        .imageScale(.large)
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View{
    let content: String
    //@State basically creates a pointer. Look at that later on
    @State var isFaceUp = true
    
    var body: some View{
        ZStack{
            //since we're keep using RoundedRectangle(cornerRadius: 12) 3 times we can create a local
            //variable named as base
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }else{
                base.fill()
            }
        }
        
        .onTapGesture{
            //we can use toggle instead of this line of code it is the same logic.
            //isFaceUp = !isFaceUp
            isFaceUp.toggle()
        }
    }
}





#Preview {
    ContentView()
}
