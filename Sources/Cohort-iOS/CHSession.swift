//
//  CHSession.swift
//  Cohort-iOS
//
//  Created by Jacob Niedzwiecki on 2018-09-29.
//  Copyright © 2018 Jacob Niedzwiecki. All rights reserved.
//

import UIKit
import Starscream

public class CHSession: NSObject{
    private let socketURL: URL
    private var socket: WebSocket
    
    public var isConnected: Bool {
        get { return socket.isConnected }
    }
    
    public init(cohortServerURL url: URL){
        socketURL = url
        socket = WebSocket(url: self.socketURL)
        
        super.init()
        
        socket.delegate = self
    }
    
    public func connect(completion: (_ result: Bool) -> ()){
        socket.connect()
        while (!isConnected) {}
        return completion(true)
    }
}

extension CHSession: WebSocketDelegate {
    public func websocketDidConnect(socket: WebSocketClient) {
        
    }
    
    public func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        
    }
    
    public func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        
    }
    
    public func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        
    }
}
