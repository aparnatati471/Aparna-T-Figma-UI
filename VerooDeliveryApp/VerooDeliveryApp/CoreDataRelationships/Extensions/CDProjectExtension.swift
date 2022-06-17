//
//  CDProjectExtensiom.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 21/06/22.
//

import Foundation

extension CDProject {
    
    func convertToProject() -> Projects? {
        return Projects(_id: self.id ?? UUID(), _title: self.title, _name: self.toEmployee?.name)
    }

}
