//
//  Link.swift
//  iBank
//
//  Created by Юлія Воробей on 22.04.2024.
//

import UIKit

struct Link {
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    func create() -> UILabel {
        return createLink();
    }
    
    private func createLink() -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "SpaceGrotesk-Regular", size: 15)
        label.textColor = UIColor(named: "Maize")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
}
