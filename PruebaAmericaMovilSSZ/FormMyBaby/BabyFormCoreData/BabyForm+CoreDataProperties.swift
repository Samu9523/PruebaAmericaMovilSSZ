//
//  BabyForm+CoreDataProperties.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 28/07/22.
//
//

import Foundation
import CoreData


extension BabyForm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BabyForm> {
        return NSFetchRequest<BabyForm>(entityName: "BabyForm")
    }

    @NSManaged public var name: String?
    @NSManaged public var birth: String?
    @NSManaged public var gender: String?

}

extension BabyForm : Identifiable {

}
