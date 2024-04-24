//
//  Headers.swift
//  iBank
//
//  Created by Юлія Воробей on 22.04.2024.
//

import UIKit

struct Header {
    let text: String
    let type: HeaderType
//    let color: UIColor?
    
    var settings: TypeSetting {
        switch type {
        case HeaderType.h1:
            return TypeSettings.h1()
            
        case HeaderType.h2:
            return TypeSettings.h2()
            
        case HeaderType.h3:
            return TypeSettings.h3()
        }
    }
    
    init(text: String, type: HeaderType) {
        self.text = text
        self.type = type
    }
    
    func create() -> UILabel {
        return createHeader()
    }
    
    private func createHeader () -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont(name: settings.fontName, size: settings.fontSize)
        label.textColor = UIColor(named: "Isabelline")
        return label
    }
}

protocol TypeSetting {
    var fontSize: CGFloat { get set }
    var fontName: String { get set }
}

struct TypeSettings {
    struct h1: TypeSetting {
        var fontSize: CGFloat = 24
        var fontName: String = "SpaceGrotesk-Regular"
    }
    
    struct h2: TypeSetting {
        var fontSize: CGFloat = 20
        var fontName: String = "SpaceGrotesk-Regular"
    }
    
    struct h3: TypeSetting {
        var fontSize: CGFloat = 17
        var fontName: String = "SpaceGrotesk-Regular"
    }
    
//    struct h4: TypeSetting {
//        var fontSize: CGFloat
//        var fontName: String
//    }
//    
//    struct h5: TypeSetting {
//        var fontSize: CGFloat
//        var fontName: String
//    }
//    
//    struct h6: TypeSetting {
//        var fontSize: CGFloat
//        var fontName: String
//    }
}

enum HeaderType {
    case h1
    case h2
    case h3
//    case h4
//    case h5
//    case h6
}
