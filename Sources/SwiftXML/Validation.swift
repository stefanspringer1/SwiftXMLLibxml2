//
//  File.swift
//  
//
//  Created by Stefan Springer on 10.05.21.
//

import Foundation

func validate(documentPath: String, catalogPath: String? = nil) {
    let tools = Bundle.module.url(forResource: "dummy", withExtension: "txt", subdirectory: "Tools")?.deletingLastPathComponent()
    if let theTools = tools {
        var toolPath: URL?
        if let thePlatform = platform() {
            switch thePlatform {
            case "macOS.Intel":     toolPath = theTools.appendingPathComponent("Validation/libxml2").appendingPathComponent(thePlatform).appendingPathComponent("XMLValidation")
            case "macOS.ARM":       toolPath = theTools.appendingPathComponent("Validation/libxml2").appendingPathComponent(thePlatform).appendingPathComponent("XMLValidation")
            case "RedHat7.Intel":   toolPath = theTools.appendingPathComponent("Validation/libxml2").appendingPathComponent(thePlatform).appendingPathComponent("XMLValidation")
            case "Windows.Intel":   toolPath = theTools.appendingPathComponent("Validation/libxml2").appendingPathComponent(thePlatform).appendingPathComponent("XMLValidation.exe")
            default:                toolPath = nil
            }
            if let theToolPath = toolPath {
                if #available(macOS 10.13, *) {
                    do {
                        let task = Process()
                        
                        // set environment variables:
                        var environment =  ProcessInfo.processInfo.environment
                        environment["XML_CATALOG_FILES"] = catalogPath ?? ""
                        task.environment = environment
                        
                        let executableURL: URL = theToolPath
                        task.executableURL = executableURL
                        task.arguments = [documentPath]//[documentPath, "-catalog=\(catalogPath!)", "-debug"]
                        /*let outputPipe = Pipe()
                        let errorPipe = Pipe()
                        task.standardOutput = outputPipe
                        task.standardError = errorPipe*/
                        try task.run()
                    }
                    catch {
                        print("ERROR: fatal error using external program: \(error)")
                    }
                } else {
                    print("ERROR: cannot set path to executable")
                }
            }
        }
    }
    else {
        print("ERROR: unkown platform")
    }
}
