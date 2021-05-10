# SwiftXML

Using XML in Swift (experimental, in development).

## Usage on Windows

1. Install Visual Studio (get it from [https://visualstudio.microsoft.com](https://visualstudio.microsoft.com)).

2. Install CLion (get it from [https://www.jetbrains.com/clion](https://www.jetbrains.com/clion)).

3. Install the Swift toolchain (get it from [https://swift.org/download](https://swift.org/download)).

4. Start Clion.

5. Add the Swift plugin via the CLion Preferences dialog.

6. Configure the Swift toolchain in CLion.

7. Open the Swift package in CLion (open `Package.swift` in CLion and choose "open as project").

8. Include the `SwiftXML` package:
   
   In `Package.swift` add the following inside the dependencies at the top-level of the package:

    ```swift
        .package(url: "[https://github.com/stefanspringer1/SwiftXML.git](https://github.com/stefanspringer1/SwiftXML.git)", from: "0.0.1"),
    ```

    For the target, add the following dependency:

    ```swift
        .product(name: "SwiftXML", package: "SwiftXML")
    ```

9. Open (in CLion) `main.swift` and add the following code (use your paths):

    ```swift
    _ = XMLDocument(document: "my path to the XML document", catalog: "my path to the catalog")
    ```

    The second argument is optional.

    Note that, if you want to use a catalog file, an XML catalog is needed here. Also note that paths containing non-ASCII characters might pose a problem at the current state.

10.  Click the run symbol in CLion. The document should then get validated, validation errors printed, and entity definitions and their usage will be displayed.