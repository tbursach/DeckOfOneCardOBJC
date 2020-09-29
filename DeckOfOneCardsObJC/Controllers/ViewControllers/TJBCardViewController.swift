//
//  TJBCardViewController.swift
//  DeckOfOneCardsObJC
//
//  Created by Trevor Bursach on 9/29/20.
//

import UIKit

class TJBCardViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var cardSuitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    //MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCards()

    }
    
    //MARK: - Actions
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        self.fetchCards()
    }
    
    //MARK: - Helper Functions
    
    func updateViews(card: TJBCard, image: UIImage){
        self.cardSuitLabel.text = card.suit
        self.cardImageView.image = image
    }
    
    func fetchCards() {
        TJBCardController.drawNewCard(1) { (cards, error) in
            
            if let cards = cards {
                TJBCardController.fetchCardImage(cards[0]) { (image) in
                    DispatchQueue.main.async {
                        if let image = image {
                            self.updateViews(card: cards[0], image: image)
                        }
                    }
                }
                
            }
        }
            
    }
    
} // END OF CLASS
