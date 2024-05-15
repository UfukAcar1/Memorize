//
//  ContentView.swift
//  Memorize
//
//  Created by Ufuk Acar on 14.05.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = [ "👻","🎃","🧙🏼","🐈‍⬛","😈","🕷️","🤡"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            
            Spacer()
            cardCountAdjusters
        }
            .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View{
        Button(action: {
                cardCount += offset
        },label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View{
        cardCountAdjusters(by: +1, symbol: "plus")
    }
    
    var cardRemover: some View{
        cardCountAdjusters(by: -1, symbol: "minus")
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
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1:0)
            base.fill().opacity(isFaceUp ? 0:1)
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
