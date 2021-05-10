import Foundation

func replaceMany(inText source: String, replacements: Dictionary<String,String>) -> String {
    // TODO: do this more effiently
    var _text = source
    replacements.forEach { searchText, replaceText in
        _text = _text.replacingOccurrences(of: searchText, with: replaceText)
    }
    return _text
}

func replaceMany(inFile source: String, replacements: Dictionary<String,String>, toFile target: String) {
    //writing
     do {
        let text = try String(contentsOf: URL(fileURLWithPath: source), encoding: .utf8)
        return try replaceMany(inText: text, replacements: replacements)
            .write(to: URL(fileURLWithPath: target), atomically: false, encoding: .utf8)
     }
     catch {
        print("ERROR: could convert \(source) to \(target)")
    }
}

func platform() -> String? {
    #if os(macOS)
        #if arch(x86_64)
            return "macOS.Intel"
        #else
            return "macOS.ARM"
        #endif
    #elseif os(Linux)
        #if arch(x86_64)
            return "RedHat7.Intel"
        #else
            return nil
        #endif
    #else
        #if arch(x86_64)
            return "Windows.Intel"
        #else
            return nil
        #endif
    #endif
}
