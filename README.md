Flutter Python
==============
![code example](https://i.ibb.co/2NQsWHc/band.png)


How many times do you wished to add some Python magic to your app ? Executing a Python script inside a Flutter app is no longer a problem. All you have to do is to write your Python code and make sure that it compile successfully then call the function execute finally receive the result that's it ! As shown below the function takes the file path as a parameter.


![code example](https://i.ibb.co/7tWxvWx/carbon.png) 

# Table of Contents
- [About Python](#about-python)
- [Installing](#installing)
- [Hello World App using Python plugin](#hello-world-app-using-python-plugin)
- [Add Python Modules](#add-python-modules)
- [Verifying File Existence](#verifying-file-existence)
- [Contact & Support](#support)

# About Python
Python is a high-level, interpreted, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation. Python is dynamically-typed and garbage-collected.
# Installing

Add Python to your pubspec.yaml file:

```yaml
dependencies:
  python:
```

Import python in files that it will be used:

```dart
import 'package:python/python.dart';
```
# Hello World App using Python plugin
In order to access to Python class methods first you have to declare an instance from the class Python.
```dart
Python pythonScript = Python();
```
Then you should prepare where the result will be shown. As an example we will declare an empty String for the result.
```dart
String pythonCodeResult = "";
```
Now it's time to create the Python file that contains the code. We will give helloWorld.py as a file name.
**Make sure that the python file compiles successfully.** 
```python
print("Hello World from Python inside Flutter")
```
Add a any kind of buttons to access to OnPressed event. As an example we will use TextButton.
```dart
TextButton(
              child: const Text("Execute Python Code"),
              onPressed: () async {
                await pythonScript.execute('lib/helloWorld.py').then((result) {
                  setState(() {
                     pythonCodeResult = result;
                  });
                });
              },
            ),
```
Finally, you have the result inside pythonCodeResult variable all you have to do is to add it into Text widget in order to display it.
```dart
Text(pythonCodeResult)
```
And voila you have successfully executed Python code inside Flutter.

# Add Python modules
As usual, in order to access to Python plugin methods you need to create an instance from Python class.
```dart
Python pythonScript = Python();
```
Let's define the list of wanted modules. Note that every module requires two parameters. The first one is the name and the second one is the version.
```dart
List<Module> modules = [
Module("Flask", "2.1.2"),
Module("requests", "0.11.1"),
Module("numpy", "1.22.3"),
];
```
Adding a module is done by calling the method **addModules** and it takes a list of modules just like below.
```dart
pythonScript.addModules(modules);
```
And voila! You've successfully added the required Python modules.

# Verifying file existence
Unlike the **exists()** method. The method **fileExists()** is provided by Python package that allows the developer to verify if the file exists or not. The main difference between these two functions is **fileExists()** is not asynchronous which means you can assign the result to a variable directly also you can use it as if statement conditions.
To use this method you have to define an instance from the class Python
```dart
Python pythonScript = Python();
```
Then call the function and pass the path as a paramter
```dart
bool isExists = pythonScript('lib/helloWorld.py');
```
The method returns bool that's why we assigned the result to a bool variable.


Developer Contact: [Nabil Krissane](https://linktr.ee/nabilkrs)
------

------
# Support
**You can support me by :**


| Bitcoin Wallet Address  | 3Kty65Zi4i4QPPFgy9UqTYappcjbLsiDU7                                                                         |
|-------------------------|------------------------------------------------------------------------------------------------------------|
| Eutherum Wallet Address | 0xb57Dd089D3339b1E36c555B9AAB582934dE76031                                                                 |
| Patreon Account         | [![](https://i.ibb.co/dJ7KGwF/avatars-000146225244-3a983t-t500x500.jpg)](https://www.patreon.com/nabilkrs) |
