//
//  URLExtension.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 26/07/2023.
//

import Foundation

public extension URL {

    static func storeURL(for appGroup: String, databaseName: String) -> URL {
        guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
            fatalError("Shared file container could not be created.")
        }
        return fileContainer.appendingPathComponent("DataModel.sqlite")
    }
}
