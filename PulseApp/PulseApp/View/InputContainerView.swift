//
//  InputContainerView.swift
//  PulseApp
//
//  Created by Hiram Castro on 18/01/21.
//

import UIKit

class InputContainerView: UIView {
    
    init(image: UIImage, textfield: UITextField) {
        super.init(frame: .zero)
        
        setHeight(height: 50)
        
        let icon = UIImageView()
        icon.image = image
        icon.tintColor = .white
        icon.alpha = 0.87
        
        addSubview(icon)
        icon.centerY(inView: self)
        icon.anchor(left: self.leadingAnchor, paddingLeft: 8)
        icon.setDimensions(height: 24, width: 24)
        
        addSubview(textfield)
        textfield.centerY(inView: self)
        textfield.anchor(left: icon.trailingAnchor,
                         bottom: self.bottomAnchor,
                         right: self.trailingAnchor,
                         paddingLeft: 8,
                        paddingBottom: -4)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        addSubview(dividerView)
        dividerView.anchor(left: icon.leadingAnchor,
                           bottom: self.bottomAnchor,
                           right: self.trailingAnchor,
                           height: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
