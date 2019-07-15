import Foundation
import KituraWebSocket

class BattleWebSocketService: WebSocketService {
    private var connections: [String: WebSocketConnection] = [:]
    
    public func connected(connection: WebSocketConnection) {
        connections[connection.id] = connection
    }
    
    public func disconnected(connection: WebSocketConnection, reason: WebSocketCloseReasonCode) {
        connections.removeValue(forKey: connection.id)
    }
    
    func received(message: Data, from: WebSocketConnection) {
        guard let _ = try? JSONDecoder().decode(User.self, from: message) else {
            from.close(reason: .invalidDataType, description: "Battle-Server Only Accepts User Model Data.")
            return
        }
        for connection in connections {
            if connection.key != from.id {
                connection.value.send(message: message)
            }
        }
    }
    
    func received(message: String, from: WebSocketConnection) {
    }
}
