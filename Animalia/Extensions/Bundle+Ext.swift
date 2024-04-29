//
//  Bundle+Ext.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import Foundation

// extension untuk decode data json sebagai bundle (lokal data)
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. menentukan lokasi file json
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Field to locate \(file) in bundle.")
        }
        
        // 2. set data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bunfle.")
        }
        
        // 3. buat decoder
        let decoder = JSONDecoder()
        
        // 4. simpan sebagai hasil property dari hasil data json yang sudah didecode
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decoded file \(file) from bundle")
        }
        
        // 5. return data yang sudah didecode dan ready-to-use
        return loaded
    }
}
