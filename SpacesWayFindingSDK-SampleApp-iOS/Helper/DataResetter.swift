//
//  DataResetter.swift
//  SpacesWayfindingSample
//
//  Created by bhariswa on 21/11/25.
//

import Foundation
import Security

struct DataResetter {
    static func resetAppData() {

        // 1️⃣ Clear UserDefaults
        if let bundleId = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleId)
            UserDefaults.standard.synchronize()
            print("🔄 UserDefaults cleared")
        }

        // 2️⃣ Clear Keychain Items
        let secItemClasses = [
            kSecClassGenericPassword,
            kSecClassInternetPassword,
            kSecClassCertificate,
            kSecClassKey,
            kSecClassIdentity
        ]

        for secItemClass in secItemClasses {
            let query: NSDictionary = [kSecClass: secItemClass]
            SecItemDelete(query)
        }
        print("🔄 Keychain cleared")

        // 3️⃣ Delete Documents, Library, Caches
        let fm = FileManager.default
        let dirs = [
            fm.urls(for: .documentDirectory, in: .userDomainMask).first,
            fm.urls(for: .libraryDirectory, in: .userDomainMask).first,
            fm.urls(for: .cachesDirectory, in: .userDomainMask).first
        ].compactMap { $0 }

        for url in dirs {
            if let items = try? fm.contentsOfDirectory(at: url, includingPropertiesForKeys: nil) {
                for item in items {
                    try? fm.removeItem(at: item)
                }
            }
        }
        print("🔄 File system cleared")

        print("✅ All app data reset (DEBUG only)")
    }
}
