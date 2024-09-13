
# hina-react-native-abtest

## Getting started

`$ npm install hina-react-native-abtest --save`

### Mostly automatic installation

`$ react-native link hina-react-native-abtest`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `hina-react-native-abtest` and add `RNHinaReactNativeAbtest.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNHinaReactNativeAbtest.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.hina.react.abtest.RNHinaReactNativeAbtestPackage;` to the imports at the top of the file
  - Add `new RNHinaReactNativeAbtestPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':hina-react-native-abtest'
  	project(':hina-react-native-abtest').projectDir = new File(rootProject.projectDir, 	'../node_modules/hina-react-native-abtest/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':hina-react-native-abtest')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNHinaReactNativeAbtest.sln` in `node_modules/hina-react-native-abtest/windows/RNHinaReactNativeAbtest.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Hina.React.Native.Abtest.RNHinaReactNativeAbtest;` to the usings at the top of the file
  - Add `new RNHinaReactNativeAbtestPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNHinaReactNativeAbtest from 'hina-react-native-abtest';

// TODO: What to do with the module?
RNHinaReactNativeAbtest;
```
  