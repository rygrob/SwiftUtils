//
//  File.swift
//  
//
//  Created by Ryan Robinson on 6/8/23.
//

import Foundation

public extension CGPoint {
    func distance(to other: CGPoint) -> CGFloat {
        return sqrt(pow(self.x - other.x, 2) + pow(self.y - other.y, 2))
    }
}
