//
//  Card.swift
//  iBank
//
//  Created by Юлія Воробей on 23.04.2024.
//

import UIKit

struct Card {
    let name: String?
    let balance: Float?
    let number: Int
    let image: UIImage
    let type: CardType
    let size: CardSize
    var currency: CardCurrency = CardCurrency.us_dollar
    
    var cardSize: CardSetting {
        return size == CardSize.medium ? CardSettings.medium() : CardSettings.small()
    }
    
    var cardType: CardTypeSetting {
        return type == CardType.visa ? CardTypeSettings.visa() : CardTypeSettings.mastercard()
    }
    
    var cardCurrency: CardCurrencySetting {
        switch currency {
        case CardCurrency.us_dollar:
            return CardCurrencySettings.us_dollar()
            
        case CardCurrency.euro:
            return CardCurrencySettings.euro()
            
        case CardCurrency.ukrainian_hryvnia:
            return CardCurrencySettings.ukrainian_hryvnia()
            
        case CardCurrency.australian_dollar:
            return CardCurrencySettings.australian_dollar()
            
        case CardCurrency.canadian_dollar:
            return CardCurrencySettings.canadian_dollar()
            
        case CardCurrency.great_british_pound_sterling:
            return CardCurrencySettings.great_british_pound_sterling()
            
        case CardCurrency.japanese_yen:
            return CardCurrencySettings.japanese_yen()
        }
    }
    
    init(image: UIImage, number: Int, type: CardType, size: CardSize) {
        self.image = image
        self.number = number
        self.type = type
        self.size = size
        
        self.name = nil
        self.balance = nil
    }
    
    init(name: String, image: UIImage, balance: Float, number: Int, currency: CardCurrency, type: CardType, size: CardSize) {
        self.name = name
        self.image = image
        self.balance = balance
        self.number = number
        self.currency = currency
        self.type = type
        self.size = size
    }
    
    
    func create() -> UIView {
        return createCard()
    }
    
    func getSettings() -> CardSetting {
        return cardSize
    }
    
    
    private func createCard() -> UIView {
        let cardView = UIView()
        cardView.backgroundColor = CardSettings.background
        cardView.layer.cornerRadius = cardSize.corner
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.snp.makeConstraints() {
            $0.width.equalTo(cardSize.width)
            $0.height.equalTo(cardSize.height)
        }
        
        // Card Background
        let backgroundView = UIImageView(image: image)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.layer.cornerRadius = cardSize.corner
        backgroundView.layer.masksToBounds = true
        
        cardView.addSubview(backgroundView)
        backgroundView.snp.makeConstraints() {
            $0.top.equalTo(cardView.snp.top)
            $0.leading.equalTo(cardView.snp.leading)
            $0.trailing.equalTo(cardView.snp.trailing)
            $0.bottom.equalTo(cardView.snp.bottom)
        }

        
        // Card Content View
        let cardSpace = 25
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.addSubview(view)
        view.snp.makeConstraints() {
            $0.top.equalTo(cardView.snp.top).offset(cardSpace)
            $0.leading.equalTo(cardView.snp.leading).offset(cardSpace)
            $0.trailing.equalTo(cardView.snp.trailing).offset(-cardSpace)
            $0.bottom.equalTo(cardView.snp.bottom).offset(-cardSpace)
        }
        
        
        if(size == CardSize.medium) {
            //Balance Label
            let balanceLabel = UILabel()
            balanceLabel.text = "Balance"
            balanceLabel.textColor = CardSettings.color
            balanceLabel.font = UIFont(name: CardSettings.fontName, size: CardSettings.mainFontSize)
            balanceLabel.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(balanceLabel)
            balanceLabel.snp.makeConstraints() {
                $0.top.equalTo(view.snp.top)
            }
            
            // Connection Icon
            let connectIcon = UIImage(systemName: "wave.3.forward")
            let connectIconView = UIImageView(image: connectIcon)
            connectIconView.tintColor = UIColor(named: "Night")
            connectIconView.translatesAutoresizingMaskIntoConstraints = false
    
            view.addSubview(connectIconView)
            connectIconView.snp.makeConstraints() {
                $0.top.equalTo(view.snp.top)
                $0.trailing.equalTo(view.snp.trailing)
            }
            
            // Balance Value Label
            let balanceValueLabel = UILabel()
            balanceValueLabel.text = "\(cardCurrency.symbol) \(balance!)"
            balanceValueLabel.textColor = CardSettings.color
            balanceValueLabel.font = UIFont(name: CardSettings.fontName, size: 32)
            balanceValueLabel.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(balanceValueLabel)
            balanceValueLabel.snp.makeConstraints() {
                $0.top.equalTo(balanceLabel.snp.top).offset(50)
            }
        }
        
        // Card Type Image : Mastercard or Visa
        let typeImage = cardType.image
        let typeImageView = UIImageView(image: typeImage)
        typeImageView.translatesAutoresizingMaskIntoConstraints = false
        typeImageView.contentMode = .scaleAspectFit

        view.addSubview(typeImageView)
        typeImageView.snp.makeConstraints() {
            $0.bottom.equalTo(view.snp.bottom)
            $0.leading.equalTo(view.snp.leading)
            
            $0.width.equalTo(cardType.width)
            $0.height.equalTo(cardType.height)
        }
        
        // Card Number Label
        let cardNumberLabel = UILabel()
        let cardNumber = String(number)
        let lastFour = String(cardNumber.suffix(4))
        
        cardNumberLabel.text = "• • \(lastFour)"
        cardNumberLabel.textColor = CardSettings.color
        cardNumberLabel.font = UIFont(name: CardSettings.fontName, size: 16)
        cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cardNumberLabel)
        cardNumberLabel.snp.makeConstraints() {
            $0.bottom.equalTo(view.snp.bottom).offset(-3)
            $0.leading.equalTo(typeImageView.snp.trailing).offset(10)
        }
        
        // Name Label
        if name != nil {
            let nameLabel = UILabel()
            nameLabel.text = name
            nameLabel.textColor = CardSettings.color
            nameLabel.font = UIFont(name: CardSettings.fontName, size: CardSettings.mainFontSize)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(nameLabel)
            nameLabel.snp.makeConstraints() {
                $0.bottom.equalTo(view.snp.bottom).offset(-3)
                $0.trailing.equalTo(view.snp.trailing)
            }
        }
        return cardView
    }
    
    
    
}

// MARK: - Card Type

enum CardType {
    case visa
    case mastercard
}


protocol CardTypeSetting {
    var image: UIImage { get set }
    var width: CGFloat { get set }
    var height: CGFloat { get set }
}

struct CardTypeSettings {
    struct visa: CardTypeSetting {
        var width: CGFloat = 45
        var height: CGFloat = 25
        var image: UIImage = UIImage(named: "visa")!
    }
    
    struct mastercard: CardTypeSetting {
        var width: CGFloat = 35
        var height: CGFloat = 25
        var image: UIImage = UIImage(named: "mastercard")!
    }
}


// MARK: - Card Currency

enum CardCurrency{
    case us_dollar
    case euro
    case ukrainian_hryvnia
    case japanese_yen
    case great_british_pound_sterling
    case australian_dollar
    case canadian_dollar
}

protocol CardCurrencySetting {
    var symbol: String { get set }
    var short: String { get set }
}

struct CardCurrencySettings {
    struct us_dollar: CardCurrencySetting {
        var symbol: String = "$"
        var short: String = "USD"
    }
    
    struct euro: CardCurrencySetting {
        var symbol: String = "€"
        var short: String = "EUR"
    }
    
    struct ukrainian_hryvnia: CardCurrencySetting {
        var symbol: String = "₴"
        var short: String = "UAH"
    }
    
    struct japanese_yen: CardCurrencySetting {
        var symbol: String = "¥"
        var short: String = "JPY"
    }
    
    struct great_british_pound_sterling: CardCurrencySetting {
        var symbol: String = "£"
        var short: String = "GBP"
    }
    
    struct australian_dollar: CardCurrencySetting {
        var symbol: String = "$"
        var short: String = "AUD"
    }
    
    struct canadian_dollar: CardCurrencySetting {
        var symbol: String = "$"
        var short: String = "CDN"
    }
}

// MARK: - Card Settings

enum CardSize {
    case medium
    case small
}

protocol CardSetting {
    var corner: CGFloat { get set }
    var width: Int { get set }
    var height: Int { get set }
}

struct CardSettings {
    struct medium: CardSetting {
        var corner: CGFloat = 15
        var width: Int = 320
        var height: Int = 200
    }
    
    struct small: CardSetting {
        var corner: CGFloat = 10
        var width: Int = 50
        var height: Int = 50
    }
    
    static let background: UIColor = UIColor(named: "Jet")!
    static let color: UIColor = UIColor(named: "Isabelline")!
    static let fontName: String = "SpaceGrotesk-Regular"
    static let mainFontSize: CGFloat = 14
}
