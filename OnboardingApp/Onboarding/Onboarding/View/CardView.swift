import SwiftUI

struct CardView: View {
    @Binding var card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .foregroundStyle(.white)
                .shadow(color: .gray, radius: 3)
            VStack(spacing: 60) {
                Image(card.imageName, bundle: .main)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, Constants.horizontalPadding)
                Text(card.description)
                    .font(.system(.title, design: .rounded))
                    .lineLimit(6)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}

extension CardView {
    enum Constants {
        static let horizontalPadding: CGFloat = 60
        static let cornerRadius: CGFloat = 5
        static let lightGreyColor = Color(.lightGrey)
    }
}

#Preview {
    CardView(card: .constant(Card.staticCardsData.first!))
}
