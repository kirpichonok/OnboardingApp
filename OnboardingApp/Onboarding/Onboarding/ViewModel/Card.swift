struct Card {
    let imageName: String
    let description: String
}

extension Card {
    static let staticCardsData = [
        Card(
            imageName: "image1",
            description: "Order at home with no distance limits. It's not magic, it's Moovenda!"
        ),
        Card(
            imageName: "image2",
            description: "Every now and then we send exclusive discounts via Push notifications, are you in?"
        ),
        Card(
            imageName: "image3",
            description: "To make the most of the app, can you share your location with us?"
        ),
    ]
}
