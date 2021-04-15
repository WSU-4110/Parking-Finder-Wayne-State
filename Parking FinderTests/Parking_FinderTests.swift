//
//  Parking_FinderTests.swift
//  Parking FinderTests
//
//  Created by Server on 2/7/21.
//

import XCTest
import UIKit
import CoreData
import Firebase
@testable import Parking_Finder


class AppDelegate: UIResponder, UIAppDelegate
{
    func Testing_saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
               
                let error = error as Error
              fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

}

