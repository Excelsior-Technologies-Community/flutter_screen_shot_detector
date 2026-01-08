# 📦 Screen Protector
A lightweight Flutter library to **protect screens from screen recording and screenshots**.   

✔ Block screenshots on **Android**   
✔ Blur UI when **screen recording starts**   
✔ Detect screenshots & recordings on **iOS**   
✔ Wrap any page and secure it   
✔ Zero configuration (Android needs 1 optional native line)


---

## 🚀 Installation
### Add in your `pubspec.yaml`:
```yaml
dependencies:
  screen_protector:
    path: '.../flutter_screen_shot_protector/screen_protector'
```

### Using GitHub (Recommended during development) :
```yaml
dependencies:
  screen_protector:
    git:
      url: https://github.com/YOUR_USERNAME/flutter_screen_shot_protector.git
```

---

## 🛡 Android Setup (Required for blocking screenshots)
Edit:
```swift
android/app/src/main/kotlin/.../MainActivity.kt
```
Add:
```kotlin
override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    window.setFlags(
        WindowManager.LayoutParams.FLAG_SECURE,
        WindowManager.LayoutParams.FLAG_SECURE
    )
}
```
✔ Screenshot blocked   
✔ Screen recording black   
❌ Android cannot detect screenshot reliably (OS limitation)

---

## 🍏 iOS Setup
No change required 🎉   
Detection + blur overlay works automatically.

---

## 🎯 Usage
Wrap your secure screen using `ScreenProtector`:
```dart
import 'package:screen_protector/screen_protector.dart';

class SecurePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenProtector(
      child: Scaffold(
        appBar: AppBar(title: Text("Protected Screen")),
        body: Center(
          child: Text("This content is protected 🔐", style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
```

---

## 🧪 Example Output
| Action             | Result                              |
| ------------------ | ----------------------------------- |
| Android Screenshot | ❌ Blocked (black screen)            |
| iOS Screenshot     | 📸 Detected                         |
| Android Recording  | 🔐 UI blur/black (device-dependent) |
| iOS Recording      | 🔒 UI blur immediately              |

---

## ❤️ Features
🚫 Block screenshots (Android)

🌑 Screen turns unreadable while recording

📸 Screenshot detection (iOS)

🔒 Wrap any widget or full screen

⚡ No complicated setup

🧩 Works with any Flutter version 3.x+

---

## ⚠ Limitations (Android)
Due to OS restrictions:
| Feature           | Android       | iOS   |
| ----------------- | ------------- | ----- |
| Detect screenshot | ❌ No          | ✔ Yes |
| Detect recording  | ⚠ Sometimes   | ✔ Yes |
| Block screenshot  | ✔ Yes         | ❌ No  |
| Block recording   | ✔ Flag-secure | ❌ No  |

---

## 📄 License
```text
Copyright (c) 2026 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```


