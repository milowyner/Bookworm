//
//  DetailView.swift
//  Bookworm
//
//  Created by Milo Wyner on 8/21/21.
//

import SwiftUI
import CoreData

struct DetailView: View {
    let book: Book
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknown author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
            Spacer()
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static var previews: some View {
        let book = Book(context: context)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."

        return NavigationView {
            DetailView(book: book)
        }
    }
}