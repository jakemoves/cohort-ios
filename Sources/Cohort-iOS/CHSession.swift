//
//  CHSession.swift
//  Cohort-iOS
//
//  Created by Jacob Niedzwiecki on 2018-09-29.
//  Copyright © 2018 Jacob Niedzwiecki. All rights reserved.
//

import UIKit
import Starscream
import Alamofire

public class CHSession: NSObject{
    private let serverURL: URL
    
    private var socket: WebSocket
    
    public var isConnected: Bool {
        get { return socket.isConnected }
    }
    
    private var httpURL: URL {
        get { return serverURL.appendingPathComponent(":3000")}
    }
    
    private var socketURL: URL {
        get { return serverURL.appendingPathComponent(":8080")}
    }
    
    public init(cohortServerURL url: URL){
        serverURL = url
        
        socket = WebSocket(url: serverURL.appendingPathComponent(":8080"))
        
        super.init()
        
        socket.delegate = self
    }
    
    public func connect(completion: (_ result: Bool) -> ()){
        socket.connect()
        while (!isConnected) {}
        return completion(true)
    }
    
    public func registerForNotifications(token: Data, completion: (_ result: Bool) -> ()){
        let tokenString = token.hexString()
        debugPrint(tokenString)
        let params: Parameters = [ "token": tokenString ]
        Alamofire.request(serverURL.absoluteString + "/register-for-notifications", method: .post, parameters: params, encoding: JSONEncoding.default).validate()
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

extension Data {
    func hexString() -> String {
        var bytesPointer: UnsafeBufferPointer<UInt8> = UnsafeBufferPointer(start: nil, count: 0)
        self.withUnsafeBytes { (bytes) in
            bytesPointer = UnsafeBufferPointer<UInt8>(start: UnsafePointer(bytes), count:self.count)
        }
        let hexBytes = bytesPointer.map { return String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}
