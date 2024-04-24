//
//  ViewController.swift
//  iBank
//
//  Created by Юлія Воробей on 22.04.2024.
//

import UIKit

class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "Night")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
        super.viewWillAppear(animated)
    }
    
    func setupUI() {
        let superviewSpaceLeading = 20
        let superviewSpaceTrailing = -20
        
        
        let notificationButton = TileButton(image: "envelope.badge", style: TileButtonStyle.base, size: TileButtonSize.medium).create()
        let searchButton = TileButton(image: "magnifyingglass", style: TileButtonStyle.base, size: TileButtonSize.medium).create()
        let scanButton = TileButton(image: "camera.viewfinder",  style: TileButtonStyle.accent, size: TileButtonSize.medium).create()
        
        // My Cards Row
        let cardTitle = Header(text: "My cards", type: HeaderType.h1).create()
        let seeAllCardsLink = Link(text: "See all").create()
        
        let plusCardTileButtonStruct = TileButton(image: "plus", style: TileButtonStyle.base, size: TileButtonSize.medium)
        let plusCardButton = plusCardTileButtonStruct.create()
        let plusCardButtonSize = plusCardTileButtonStruct.getSize()
        
        //Cards Row
        let cardStruct = Card(name: "Carl Sanders",
                              image: UIImage(named: "card_style_1")!,
                              balance: 10245.15,
                              number: 43522635264516491,
                              currency: CardCurrency.us_dollar,
                              type: CardType.mastercard,
                              size: CardSize.medium)
        let card1 = cardStruct.create()
        let cardSettings = cardStruct.getSettings()
        
        let card2 = Card(name: "Carl Sanders",
                              image: UIImage(named: "card_style_3")!,
                         balance: 4586.77,
                              number: 3452859153956572,
                              currency: CardCurrency.ukrainian_hryvnia,
                              type: CardType.visa,
                         size: CardSize.medium).create()
        
        let card3 = Card(name: "Carl Sanders",
                              image: UIImage(named: "card_style_2")!,
                         balance: 63785.00,
                              number: 8593035280451092,
                              currency: CardCurrency.euro,
                              type: CardType.visa,
                         size: CardSize.medium).create()
        
        
        // Tiles Row
        let paymentsTileButtonStruct = TileButton(image: "wallet.pass", title: "Payments", style: TileButtonStyle.base, size: TileButtonSize.large)
        let paymentsButton = paymentsTileButtonStruct.create()
        let paymentsButtonSize = paymentsTileButtonStruct.getSize()
        
        let transferButton = TileButton(image: "banknote", title: "Transfer", style: TileButtonStyle.base, size: TileButtonSize.large).create()
        let analiticssButton = TileButton(image: "chart.xyaxis.line", title: "Analiticss", style: TileButtonStyle.base, size: TileButtonSize.large).create()
        
        // Recent Transactions
        let transactionsTitle = Header(text: "Recent transactions", type: HeaderType.h1).create()
        let seeAllTransactionsLink = Link(text: "See all").create()
        let listItem1 = ListItem(image: UIImage(named: "spotify")!, title: "Spotify", subtitle: "Aug 24, 5:36 PM", rightTitle: "-$2.99").create()
        let listItem2 = ListItem(image: UIImage(named: "figma")!, title: "Figma", subtitle: "Aug 21, 10:55 AM", rightTitle: "-$10.50").create()
        let listItem3 = ListItem(image: UIImage(named: "netflix")!, title: "Netflix", subtitle: "Aug 21, 9:14 AM", rightTitle: "-$4.59").create()
        let listItem4 = ListItem(image: UIImage(named: "food")!, title: "METRO", subtitle: "Aug 20, 1:32 PM", rightTitle: "-₴376.02").create()
        
        // Main View
        let mainView = initMainScrollView()
        
        
        // Notification Button
        mainView.addSubview(notificationButton)
        notificationButton.snp.makeConstraints() {
            $0.top.equalTo(mainView.snp.top)
            $0.leading.equalTo(mainView.snp.leading)
        }
        
        // Search Buuton
        mainView.addSubview(searchButton)
        searchButton.snp.makeConstraints() {
            $0.top.equalTo(mainView.snp.top)
            $0.leading.equalTo(notificationButton.snp.trailing).offset(20)
        }
        
       // Scan Button
        mainView.addSubview(scanButton)
        scanButton.snp.makeConstraints() {
            $0.top.equalTo(mainView.snp.top)
            $0.trailing.equalTo(mainView.snp.trailing)
        }
        
        // My Cards Row
        let myCardsRowStackView = UIStackView()
        myCardsRowStackView.translatesAutoresizingMaskIntoConstraints = false
        myCardsRowStackView.axis = .horizontal
        
        mainView.addSubview(myCardsRowStackView)
        myCardsRowStackView.snp.makeConstraints() {
            $0.top.equalTo(notificationButton.snp.bottom).offset(20)
            $0.leading.equalTo(mainView.snp.leading)
            $0.trailing.equalTo(mainView.snp.trailing)
            $0.height.equalTo(plusCardButtonSize)
        }
        
       // My Card Title
        myCardsRowStackView.addSubview(cardTitle)
        cardTitle.snp.makeConstraints() {
            $0.centerY.equalTo(myCardsRowStackView)
            $0.leading.equalTo(myCardsRowStackView.snp.leading)
        }
        
        // See All Cards Link
        myCardsRowStackView.addSubview(seeAllCardsLink)
        seeAllCardsLink.snp.makeConstraints() {
            $0.centerY.equalTo(myCardsRowStackView)
            $0.trailing.equalTo(myCardsRowStackView.snp.trailing)
        }
        
        // Add New Card Button
        myCardsRowStackView.addSubview(plusCardButton)
        plusCardButton.snp.makeConstraints() {
            $0.top.equalTo(myCardsRowStackView.snp.top)
            $0.leading.equalTo(cardTitle.snp.trailing).offset(20)
        }
        
        
        // Horizontal Scroll View
        let horizontalScrollView = UIScrollView()
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(horizontalScrollView)
        horizontalScrollView.snp.makeConstraints() {
            $0.top.equalTo(myCardsRowStackView.snp.bottom).offset(20)
            $0.width.equalTo(mainView.snp.width)
            $0.height.equalTo(cardSettings.height)
        }
        
        let horizontalViewContent = UIView()
        horizontalViewContent.translatesAutoresizingMaskIntoConstraints = false
                
        let cardSpace = 15
        let contentWidth = (cardSettings.width * 3) + (cardSpace * 3)
        
        horizontalScrollView.addSubview(horizontalViewContent)
        horizontalViewContent.snp.makeConstraints() {
            $0.top.equalTo(horizontalScrollView.snp.top)
            $0.leading.equalTo(horizontalScrollView.snp.leading)
            $0.trailing.equalTo(horizontalScrollView.snp.trailing)
            $0.bottom.equalTo(horizontalScrollView.snp.bottom)
            
            $0.height.equalTo(horizontalScrollView.snp.height)
            $0.width.equalTo(contentWidth)
        }

        // Card 1
        horizontalViewContent.addSubview(card1)
        card1.snp.makeConstraints() {
            $0.leading.equalTo(horizontalViewContent.snp.leading)
            $0.top.equalTo(horizontalViewContent.snp.top)
        }
        
        // Card 2
        horizontalViewContent.addSubview(card2)
        card2.snp.makeConstraints() {
            $0.leading.equalTo(card1.snp.trailing).offset(cardSpace)
            $0.top.equalTo(horizontalViewContent.snp.top)
        }
        
        // Card 3
        horizontalViewContent.addSubview(card3)
        card3.snp.makeConstraints() {
            $0.leading.equalTo(card2.snp.trailing).offset(cardSpace)
            $0.top.equalTo(horizontalViewContent.snp.top)
        }
        
        
        // Tiles Row
        let tilesRowStackView = UIStackView()
        tilesRowStackView.translatesAutoresizingMaskIntoConstraints = false
        tilesRowStackView.axis = .horizontal
        
        mainView.addSubview(tilesRowStackView)
        tilesRowStackView.snp.makeConstraints() {
            $0.top.equalTo(horizontalScrollView.snp.bottom).offset(20)
            $0.leading.equalTo(mainView.snp.leading)
            $0.trailing.equalTo(mainView.snp.trailing)
            $0.height.equalTo(paymentsButtonSize)
        }
        
        // Payments Tile
        tilesRowStackView.addSubview(paymentsButton)
        paymentsButton.snp.makeConstraints() {
            $0.top.equalTo(tilesRowStackView.snp.top)
            $0.leading.equalTo(tilesRowStackView.snp.leading)
        }
        
        // Transfer Tile
        tilesRowStackView.addSubview(transferButton)
        transferButton.snp.makeConstraints() {
            $0.top.equalTo(tilesRowStackView.snp.top)
            $0.centerX.equalTo(tilesRowStackView)
        }
        
        // Analitics Tile
        tilesRowStackView.addSubview(analiticssButton)
        analiticssButton.snp.makeConstraints() {
            $0.top.equalTo(tilesRowStackView.snp.top)
            $0.trailing.equalTo(tilesRowStackView.snp.trailing)
        }
        
        // Recent Transaction Row
        let recentTransactionRowStackView = UIStackView()
        recentTransactionRowStackView.translatesAutoresizingMaskIntoConstraints = false
        recentTransactionRowStackView.axis = .horizontal
        
        mainView.addSubview(recentTransactionRowStackView)
        recentTransactionRowStackView.snp.makeConstraints() {
            $0.top.equalTo(tilesRowStackView.snp.bottom).offset(50)
            $0.leading.equalTo(mainView.snp.leading)
            $0.trailing.equalTo(mainView.snp.trailing)
        }
        
       // Recent Transaction Title
        recentTransactionRowStackView.addSubview(transactionsTitle)
        transactionsTitle.snp.makeConstraints() {
            $0.centerY.equalTo(recentTransactionRowStackView)
            $0.leading.equalTo(recentTransactionRowStackView.snp.leading)
        }
        
        // See All Transactions Link
        recentTransactionRowStackView.addSubview(seeAllTransactionsLink)
        seeAllTransactionsLink.snp.makeConstraints() {
            $0.centerY.equalTo(recentTransactionRowStackView)
            $0.trailing.equalTo(recentTransactionRowStackView.snp.trailing)
        }
        
        
        
        // * It is a first implementation.
        // * In the next version it will be changed to the Table View
        //
        
        // List Row
        let listView = UIView()
        listView.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(listView)
        listView.snp.makeConstraints() {
            $0.top.equalTo(recentTransactionRowStackView.snp.bottom).offset(30)
            $0.leading.equalTo(mainView.snp.leading)
            $0.trailing.equalTo(mainView.snp.trailing)
            
            $0.width.equalTo(mainView.snp.width)
        }
        
        listView.addSubview(listItem1)
        listItem1.snp.makeConstraints() {
            $0.top.equalTo(listView.snp.top)
            $0.leading.equalTo(listView.snp.leading)
            $0.width.equalTo(listView.snp.width)
        }
        
        listView.addSubview(listItem2)
        listItem2.snp.makeConstraints() {
            $0.top.equalTo(listItem1.snp.bottom)
            $0.leading.equalTo(listView.snp.leading)
            $0.width.equalTo(listView.snp.width)
        }
        
        listView.addSubview(listItem3)
        listItem3.snp.makeConstraints() {
            $0.top.equalTo(listItem2.snp.bottom)
            $0.leading.equalTo(listView.snp.leading)
            $0.width.equalTo(listView.snp.width)
        }
        
        listView.addSubview(listItem4)
        listItem4.snp.makeConstraints() {
            $0.top.equalTo(listItem3.snp.bottom)
            $0.leading.equalTo(listView.snp.leading)
            $0.width.equalTo(listView.snp.width)
        }
    }
    
    private func initMainScrollView () -> UIView {
        // Main Scroll View
        let mainScrollView = UIScrollView()
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
                
        self.view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints() {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
        }
        
        // Main Scroll Content View
        let mainViewContent = UIView()
        mainViewContent.translatesAutoresizingMaskIntoConstraints = false
                
        mainScrollView.addSubview(mainViewContent)
        
        mainViewContent.snp.makeConstraints() {
            $0.top.equalTo(mainScrollView.snp.top)
            $0.leading.equalTo(mainScrollView.snp.leading).offset(20)
            $0.trailing.equalTo(mainScrollView.snp.trailing).offset(-20)
            $0.bottom.equalTo(mainScrollView.snp.bottom)
            
            $0.width.equalTo(mainScrollView.snp.width).offset(-40)
            $0.height.equalTo(900)
        }
        
        return mainViewContent
    }

}

