import Foundation
import KituraWebSocket

class BattleWebSocketService: WebSocketService {
    private var connections: [String: WebSocketConnection] = [:]
    private var roomArray: [[WebSocketConnection]] = [[]]
    
    public func connected(connection: WebSocketConnection) {
        connections[connection.id] = connection
        if roomArray.isEmpty {
            roomArray[0][0] = connection
            return
        }
        for (index, room) in roomArray.enumerated() {
            if room.count == 1 {
                roomArray[index].append(connection)
                room[0].send(message: "Opponent Found!!")
                connection.send(message: "Opponent Found!!")
                break
            } else if room.count == 2 {
                continue
            }
            if index == roomArray.count - 1 {
                roomArray[index].append(connection)
                connection.send(message: "Looking For Opponent!!")
            }
        }
    }
    
    public func disconnected(connection: WebSocketConnection, reason: WebSocketCloseReasonCode) {
        for (index, room) in roomArray.enumerated() {
            if room[0].id == connection.id {
                roomArray[index].remove(at: 0)
            } else if room[1].id == connection.id {
                roomArray[index].remove(at: 1)
            }
        }
        connections.removeValue(forKey: connection.id)
    }
    
    func received(message: Data, from: WebSocketConnection) {
        guard let _ = try? JSONDecoder().decode(User.self, from: message) else {
            from.close(reason: .invalidDataType, description: "Battle-Server Only Accepts User Model Data.")
            return
        }
        for room in roomArray {
            if room[0].id == from.id {
                room[1].send(message: message)
            } else if room[1].id == from.id {
                room[0].send(message: message)
            }
        }
    }
    
    func received(message: String, from: WebSocketConnection) {
    }
}
