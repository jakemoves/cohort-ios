//
//  CHSession.swift
//  Cohort-iOS
//
//  Created by Jacob Niedzwiecki on 2018-09-29.
//  Copyright © 2018 Jacob Niedzwiecki. All rights reserved.
//

import UIKit
import Starscream

class CHSession: NSObject{
    let socketURL: URL
    var socket: WebSocket
    
    var isConnected: Bool {
        get { return socket.isConnected }
    }
    
    init(cohortServerURL url: URL){
        socketURL = url
        socket = WebSocket(url: self.socketURL)
        
        super.init()
        
        socket.delegate = self
    }
    
    func connect(completion: (_ result: Bool) -> ()){
        socket.connect()
        while (!isConnected) {}
        return completion(true)
    }
}

extension CHSession: WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        
    }
}
