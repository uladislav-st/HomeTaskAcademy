import Foundation

private enum Key: String {
    case custom
}

final class StorageManager {
    static let shared = StorageManager()
    private init() {}
    
    func save() {
        let model = nameWorld(name: "Hello, World!")
        UserDefaults.standard.set(encodable: model, forKey: Key.custom.rawValue)
    }
    
    func load() -> nameWorld? {
        return UserDefaults.standard.value(nameWorld.self, forKey: Key.custom.rawValue)
    }
}

extension UserDefaults {
    func set<T: Encodable>(encodable: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(encodable) {
            set(data, forKey: key)
        }
    }
    
    func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        let decoder = JSONDecoder()
        if let data = object(forKey: key) as? Data,
           let value = try? decoder.decode(type, from: data) {
            return value
        }
        return nil
    }
}

struct nameWorld: Codable {
    let name: String
}
