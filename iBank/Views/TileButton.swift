//
//  TileButton.swift
//  iBank
//
//  Created by Юлія Воробей on 22.04.2024.
//

import UIKit
import SnapKit

struct TileButton {
    let image: String
    let title: String?
    let style: TileButtonStyle
    let size: TileButtonSize
    
    var color: TileColor {
        return style == TileButtonStyle.base ? TileButtonSettings.color.base() : TileButtonSettings.color.accent()
    }
    
    var sizes: TileSize {
        return size == TileButtonSize.medium ? TileButtonSettings.size.medium() : TileButtonSettings.size.large()
    }
    
    init(image: String, style: TileButtonStyle, size: TileButtonSize) {
        self.style = style
        self.size = size
        self.title = nil
        self.image = image
    }
    
    init(image: String, title: String, style: TileButtonStyle, size: TileButtonSize) {
        self.style = style
        self.size = size
        self.title = title
        self.image = image
    }
    
    func create() -> UIView {
        return createTile()
    }
    
    func getSize() -> Int {
        return sizes.size
    }
    
    private func createTile() -> UIView {
        let view = createView()
        
        view.snp.makeConstraints() {
            $0.width.equalTo(sizes.size)
            $0.height.equalTo(sizes.size)
        }
        
        let button = createButton(image: image)
        view.addSubview(button)
        
        if title != nil {
            let label = createLabel(title: title!)
            
            button.snp.makeConstraints() {
                $0.centerX.equalTo(view)
                $0.centerY.equalTo(view).offset(sizes.spaceImage)
            }
            
            view.addSubview(label)
            
            label.snp.makeConstraints() {
                $0.centerX.equalTo(view)
                $0.top.equalTo(button.snp.bottom).offset(sizes.spaceText)
            }
            
        } else {
            button.snp.makeConstraints() {
                $0.centerX.equalTo(view)
                $0.centerY.equalTo(view)
            }
        }
        
        return view
    }
    
    private func createLabel(title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textColor = color.tint
        label.font = UIFont(name: TileButtonSettings.fontName, size: sizes.font)
        label.textAlignment = NSTextAlignment.center
        return label
    }
    
    
    private func createButton(image: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: image)
        button.tintColor = color.tint
        button.configuration = config
        return button
    }
    
    private func createView() -> UIView{
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color.background
        view.layer.cornerRadius = sizes.corner
        return view
    }
    
}


enum TileButtonStyle {
    case base
    case accent
}


enum TileButtonSize {
    case medium
    case large
}

protocol TileColor {
    var background: UIColor { get set }
    var tint: UIColor { get set }
}

protocol TileSize {
    var corner: CGFloat { get set }
    var size: Int { get set }
    var font: CGFloat { get set }
    var spaceText: Int { get set }
    var spaceImage: Int { get set }
}

struct TileButtonSettings {
    struct color {
        struct base: TileColor {
            var background: UIColor = UIColor(named: "Jet")!
            var tint: UIColor = UIColor(named: "Isabelline")!
        }
        
        struct accent: TileColor {
            var tint = UIColor(named: "ErieBlack")!
            var background = UIColor(named: "Maize")!
        }
    }
    
    struct size {
        struct medium: TileSize {
            var corner: CGFloat = 15
            var size: Int = 55
            var font: CGFloat = 10
            var spaceImage: Int = -5
            var spaceText: Int = -4
        }
        
        struct large: TileSize {
            var corner: CGFloat = 20
            var size: Int = 90
            var font: CGFloat = 13
            var spaceImage: Int = -10
            var spaceText: Int = 2
        }
    }
    
    static let fontName = "SpaceGrotesk-Regular"
}
