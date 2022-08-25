//
//  NSObject.swift
//  TestMail
//
//  Created by Павел Кулицкий on 25.08.22.
//

import Foundation

//For name of cells in TableView and CollectionView
extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
