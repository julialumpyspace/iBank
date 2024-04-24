//
//  ListItem.swift
//  iBank
//
//  Created by Юлія Воробей on 24.04.2024.
//

import UIKit

struct ListItem {
    let image: UIImage
    let title: String
    let subtitle: String
    let rightTitle: String?
    
    init(image: UIImage, title: String, subtitle: String, rightTitle: String?) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.rightTitle = rightTitle
    }
    
    func create() -> UIView {
        return createListItem()
    }
    
    private func createListItem () -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.snp.makeConstraints() {
            $0.height.equalTo(80)
        }
        
        // Main View
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(view)
        view.snp.makeConstraints() {
            $0.top.equalTo(container.snp.top).offset(20)
            $0.bottom.equalTo(container.snp.top).offset(-20)
            $0.leading.equalTo(container.snp.leading)
            $0.trailing.equalTo(container.snp.trailing)
            
            $0.height.equalTo(container.snp.height).offset(-40)
            $0.width.equalTo(container.snp.width)
        }
        
        // Image View
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints() {
            $0.centerY.equalTo(view)
            $0.leading.equalTo(view.snp.leading)
            
            $0.width.equalTo(35)
            $0.height.equalTo(35)
        }
    
        // Title Label
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(named: "Isabelline")
        titleLabel.font = UIFont(name: "SpaceGrotesk-Regular", size: 18)
        titleLabel.text = title
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints() {
            $0.top.equalTo(view.snp.top)
            $0.leading.equalTo(imageView.snp.trailing).offset(20)
        }
        
        // Subtitle Label
        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textColor = UIColor(named: "BattleshipGray")
        subtitleLabel.font = UIFont(name: "SpaceGrotesk-Regular", size: 14)
        subtitleLabel.text = subtitle
        
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints() {
            $0.top.equalTo(titleLabel.snp.bottom).offset(1)
            $0.leading.equalTo(imageView.snp.trailing).offset(20)
        }
        
        // Right Label
        if rightTitle != nil {
            let rightLabel = UILabel()
            rightLabel.translatesAutoresizingMaskIntoConstraints = false
            rightLabel.textColor = UIColor(named: "Isabelline")
            rightLabel.font = UIFont(name: "SpaceGrotesk-Regular", size: 18)
            rightLabel.text = rightTitle
            
            view.addSubview(rightLabel)
            rightLabel.snp.makeConstraints() {
                $0.centerY.equalTo(view)
                $0.trailing.equalTo(view.snp.trailing)
            }
        }
        
        // Divider
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(named: "BattleshipGray")
        
        container.addSubview(divider)
        divider.snp.makeConstraints() {
            $0.top.equalTo(container.snp.bottom)
            $0.leading.equalTo(container.snp.leading)
            $0.trailing.equalTo(container.snp.trailing)
            $0.height.equalTo(1)
        }
        
        return container
    }
}
