# KiriKiri Z Multi-Platform API Reference
KiriKiri Z Multi-platform API reference.  

# About the multi-platform version
It is a version that works on Android in addition to Windows.  
GPU drawing is the main draw so that drawing speed can be obtained even in a weak environment.  
Currently it is not partially compatible with older versions.  

# Environment-dependent functions
Not all methods and properties are available in the multi-platform version in all environments.  
Some functions are environment-specific.  
Environment-specific methods etc. are written at the beginning of the sentence as [Windows] or [Android] in the explanation summary.  
Methods etc. written that way can only be used in that environment.  
Some call nothing and some exceptions occur.  
For more information, use the trailing symbol as shown below.  

* [Windows+] It can be used only on Windows, and it is prohibited to use it in other environments because there are exceptions and indefinite operation.
* [Windows\*] It can be used on Windows, and nothing happens in other environments.
* [Windows] It can be used on Windows, and its operation is uncertain in other environments.
* [Android+] It can be used on Android, and it is prohibited to use it in other environments because there are exceptions and indefinite behavior.
* [Android\*] It can be used on Android, and nothing happens in other environments.
* [Android] It can be used on Android, and its operation is uncertain in other environments.

You can dynamically determine which environment you have by using the System.isWindows or System.isAndroid properties.
For static judgment, use the preprocessor.
"Windows" is set to 1 on Windows and "android" is set to 1 on Android.  
When making a static judgment, be aware that the output result of bytecode depends on the environment.  
The bytecode for the compiled environment is output.  
To avoid this, it is necessary to change the preprocessor value in advance before calling the compile function to make it suitable for each environment and bytecode it.
