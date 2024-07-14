//
//  DataManager.swift
//  StoryApp
//
//  Created by Shraboni Banerjee on 14/07/24.
//

import Foundation

struct Category {
    var name: String
    var books: [Book]
}

struct Book {
    var title: String
    var imageName: String
    var rating: Double
    var description: String
    var story:String
}

class DataManager {
    static let shared = DataManager()
    let categories: [Category] = [
        Category(name: "All", books: [
            Book(title:"Aladdin", imageName:"01", rating:4.2, description:"xyz", story: "blah"),
            Book(title:"Cindrella", imageName:"02", rating:4.8, description:"In this timeless tale, Cinderella tells the story of a young woman who is treated unfairly by her wicked stepmother and stepsisters but dreams of a better life. With the help of her Fairy Godmother, Cinderella's wishes come true, allowing her to attend the royal ball and capture the heart of the prince.", story: "Cinderella, a kind and gentle girl, is forced into a life of servitude by her cruel stepmother and envious stepsisters. They make her do all the household chores and mock her dreams of a better life. Despite her hardships, Cinderella remains hopeful and kind-hearted, often finding solace in the company of her animal friends. One day, an invitation to a royal ball arrives, causing a stir in the household. The stepmother and stepsisters are eager to attend and do everything they can to make themselves presentable, but they forbid Cinderella from going.Left alone and heartbroken, Cinderella's luck changes when her Fairy Godmother appears. With a wave of her wand, the Fairy Godmother transforms a pumpkin into a magnificent carriage, mice into splendid horses, and Cinderella’s ragged clothes into a stunning gown complete with glass slippers. She is warned, however, that the magic will wear off at midnight.At the ball, Cinderella captures the attention of the prince with her grace, beauty, and kind spirit. They dance the night away, and the prince is utterly enchanted by her. As the clock strikes midnight, Cinderella remembers the Fairy Godmother's warning and flees the palace, leaving behind a single glass slipper in her haste.The prince, determined to find the mysterious girl who stole his heart, searches the kingdom. He declares that he will marry the girl whose foot fits the glass slipper. The royal search reaches Cinderella's home, where her stepsisters try unsuccessfully to fit into the slipper. When it is Cinderella's turn, the slipper fits perfectly. Overwhelmed with joy, the prince recognizes her as the girl from the ball.Cinderella is whisked away to the palace, where she marries the prince and forgives her stepmother and stepsisters, showing her true noble character. She and the prince live happily ever after, ruling the kingdom with kindness and grace. Her story becomes a beacon of hope and a testament to the power of kindness, dreams, and the belief that true goodness will always prevail."),
            Book(title:"Beauty and Beast", imageName:"03", rating:3.2, description:"xyz", story: "blah"),
            Book(title:"The Silent Woods", imageName:"04", rating:3.7, description:"xyz", story: "blah"),
            Book(title:"The Moon Colony", imageName:"05", rating:4.5, description:"xyz", story: "blah"),
            Book(title:"Harry Potter Sorcerers stone", imageName:"06", rating:4.2, description:"xyz", story: "blah"),
            Book(title:"Games of Thrones", imageName:"07", rating:4.2, description:"xyz", story: "blah"),
            Book(title:"Jack Sparrow", imageName:"08", rating:4.9, description:"xyz", story: "blah")
                                     
                                     
    ]),
        Category(name:"Fiction", books: [
            Book(title:"Beauty and the Beast", imageName:"03", rating:3.2, description:"xyz", story: "blah"),
            Book(title:"The Silent Woods", imageName:"04", rating:3.7, description:"xyz", story: "blah"),
            Book(title:"The Moon Colony", imageName:"05", rating:4.5, description:"xyz", story: "blah")
                                     
        ])
    ]
    
    var mostreadBook:[Book] = [
        Book(title:"Harry Potter Sorcerers stone", imageName:"06", rating:4.2, description:"xyz", story: "blah"),
        Book(title:"Games of Thrones", imageName:"07", rating:4.2, description:"xyz", story: "blah"),
        Book(title:"Jack Sparrow", imageName:"08", rating:4.9, description:"xyz", story: "blah"),
        Book(title:"The Moon Colony", imageName:"05", rating:4.5, description:"xyz", story: "blah")
                                 
    ]
}
