# SwiftXML

Using XML in Swift (experimental, in development).

## Usage on Windows (for Development)

    Note that the `Foundation` library just got split up into the three libraries `Foundation`, `FoundationNetwork`, and F`oundationXML`, and on Windows there is currently the bug [SR-14578](https://bugs.swift.org/browse/SR-14578), so the project **currently does _not_ run on Windows.** This will hopefully get resolved soon.

0. First, you should activate the Developer Mode on Windows. In the Windows settings, search `Developer` (on German systems: `Entwickler`) to find the according setting. (The reason for this is that the Swift Package Manager uses symbolic links so you need the `SeCreateSymbolicLinkPrivilege` privilege. Note that it is possible that the domain policy is overriding the local policy you set.)

1. Install Visual Studio (get it from [https://visualstudio.microsoft.com](https://visualstudio.microsoft.com)).
   
2. Install the Swift toolchain (get it from [https://swift.org/download](https://swift.org/download)). Swift will be installed to `C:\Library`. In a newly opened comamnd line winmdows, the command `swift -version` should then print the Swift version.

3. You will have to make the Windows SDK accessable to Swift. Open the `x64 Native Tools for VS2019 Command Prompt` with Administrator rights (there is an accordings entry in the context menu of its entry in the start menu) and inside it, execute the following commands. (Please also see the documentation [https://swift.org/getting-started/](https://swift.org/getting-started/) in case something has changed.)

```batch
copy %SDKROOT%\usr\share\ucrt.modulemap "%UniversalCRTSdkDir%\Include\%UCRTVersion%\ucrt\module.modulemap"
copy %SDKROOT%\usr\share\visualc.modulemap "%VCToolsInstallDir%\include\module.modulemap"
copy %SDKROOT%\usr\share\visualc.apinotes "%VCToolsInstallDir%\include\visualc.apinotes"
copy %SDKROOT%\usr\share\winsdk.modulemap "%UniversalCRTSdkDir%\Include\%UCRTVersion%\um\module.modulemap"
```

4. Install CLion (get it from [https://www.jetbrains.com/clion](https://www.jetbrains.com/clion)).

5. Create a new empty directory, and inside it, create a new Swift package by executing the command line `swift package init --type executable` in a newly opened command line window. Some files will then be created inside this directory.

6. Start Clion.

7. Add the Swift plugin via the CLion Settings dialog.

8. Configure the Swift toolchain in CLion (the settings for the Swift plugin might be the last entry in the Settings dialog). Choose the toolchain under `C:\Library\Developer\Toolchains` (select the subdirectory in `Toolchains`).

9. Open the Swift package you created in CLion (open `Package.swift` in CLion and choose "open as project").

10. Include the `SwiftXML` package:
   
In `Package.swift` add the following inside the dependencies at the top-level of the package:

```swift
.package(url: "https://github.com/stefanspringer1/SwiftXML.git", from: "0.0.11"),
```

For the target, add the following dependency:

```swift
.product(name: "SwiftXML", package: "SwiftXML"),
```

11.  Open (in CLion) `main.swift` and add the following code (use your paths):

```swift
_ = XMLDocument(document: "my path to the XML document", catalog: "my path to the catalog")
```

The second argument is optional. The argument names might change in later versions. There is an example project [SwiftXMLExample](https://github.com/stefanspringer1/SwiftXMLExample) to compare to.

Note that, if you want to use a catalog file, an _XML_ catalog is needed here. Also note that paths containing non-ASCII characters might pose a problem at the current state.

12.  Click the run symbol in CLion. (You can also execute `swift build -c release` for building or `swift run -c release` for also running inside your package. The Swift plugin for CLion is quite new, so this might even be necessary.) The document should then get validated, validation errors printed, and entity definitions and their usage will be displayed.