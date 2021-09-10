//
//  RatingView.swift
//  Bookworm
//
//  Created by Milo Wyner on 8/21/21.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1) { number in
                image(for: number)
                    .foregroundColor(number <= rating ? onColor : offColor)
                    .onTapGesture {
                        rating = number + 1
                    }
                    .accessibility(label: Text("\(number) \(number == 1 ? "star" : "stars")"))
                    .accessibility(removeTraits: .isImage)
                    .accessibility(addTraits: number <= rating ? [.isButton, .isSelected] : .isButton)
            }
        }
    }
    
    func image(for number: Int) -> Image {
        number <= rating ? onImage : (offImage ?? onImage)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
