//
//  RamdomAccessCollection+.swift
//  Just-Salmon_App
//
//  Created by Loner David on 2024/7/4.
//

import Foundation

extension RandomAccessCollection where Element: Identifiable {
    func index(ofID id: Element.ID) -> Index? {
        firstIndex(where: { $0.id == id })
    }
}
