//
//  BaseRepository.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 17/06/22.
//

import Foundation

protocol BaseRepository {
    
    associatedtype T
    
    func create(record: T)
    func getAll() -> [T]?
    func get(byIdentifier id: UUID) -> T?
    func update(record: T) -> Bool
    func delete(id: UUID) -> Bool
    
}
