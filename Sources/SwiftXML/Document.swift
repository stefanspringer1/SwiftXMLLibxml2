import Foundation
#if canImport(FoundationXML)
import FoundationXML
#endif

public class XMLDocument {
    public init(document: String, catalog: String? = nil) {

        print("document: [\(document)]")
        if let theCatalog = catalog {
            print("catalog: [\(theCatalog)]")
        }

        do {
            
            // VALIDATE DOCUMENT:
            
            validate(documentPath: document, catalogPath: catalog)
            
            // READ DOCUMENT:
            
            let content = try String(contentsOf: URL(fileURLWithPath: document), encoding: .utf8)
            
            // GETTING NAMES OF DECLARED ENTITIES, PREPARE REPLACEMENTS:

            var temporaryEntityNamesReplacements = Dictionary<String,String>()
            var entitiesRestore = Dictionary<String,String>()

            var entCount = 0
            if let entityNames = getDeclaredEntityNames(content: content) {
                entityNames.forEach { entityName in
                    entCount += 1
                    let newName = "temporaryEntityName\(entCount)"
                    temporaryEntityNamesReplacements["&\(entityName);"] = "&\(newName);"
                    entitiesRestore[newName] = entityName
                }
            }

            //temporaryEntityNamesReplacements.forEach { _in, _out in
            //    print("will replace \"\(_in)\" by \"\(_out)\"")
            //}

            //entitiesRestore.forEach { _in, _out in
            //    print("will replace back \"\(_in)\" by \"\(_out)\"")
            //}
            
            // REPLACING ENTITIES:
            
            let newContent = replaceMany(inText: content, replacements: temporaryEntityNamesReplacements)
            
            // PARSING:
            
            parse(content: newContent, entitiesRestore: entitiesRestore)
        }
        catch {
            print("ERROR: could not read document: \(error)")
        }

    }
}

// example:
//_ = XMLDocument(document: "my path to the XML document", catalog: "my path to the catalog")
