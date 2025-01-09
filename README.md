# CathyBank

# Run Test Cases with Robot Framework

## Emulator Devices
| Device             | Version |
|--------------------|---------|
| Simulator_Pixel_4 | 10      |
| Simulator_Pixel_8 | 14      |

## Software Versions
| Software         | Version  |
|------------------|----------|
| Appium           | 2.0      |
| Robot Framework  | 7.0      |
| Python           | 3.11.8   |

### Appium 2.0 Setup
若要使用 Appium 2.0 版本，請依照以下步驟設定：

1. 安裝 Appium：
    ```bash
    npm install -g appium@next
    ```

2. 安裝必要Plugin：
    ```bash
    appium plugin install execute-driver
    appium driver install xcuitest  # for iOS
    appium driver install uiautomator2  # for Android
    ```

3. 啟動 Appium：
    ```bash
    appium -p {port_you_want} --allow-cors --allow-insecure chromedriver_autodownload --use-plugins execute-driver
    ```

### Directory Structure

```
├── reports
│   ├── 截圖
│   ├── log.html
│   ├── output.xml
│   └── report.html
├── tests
│   ├── Android
│   │   ├── Keyword       # 動作 function
│   │   │   └── AndroidDeviceInfo.txt  # 定義裝置相關功能
│   │   ├── TestCase      # Robot Framework TestCase
│   │   │   └── Cathy.robot
│   │   └── Variable      # 定義 XPath 或其他變數
│   │       └── CathyBankVariable.txt
├── Robot_README.md
└── requirements.txt
```

### Testing Tools
- **語言**: Robot Framework, Python
- **工具**: Appium, Android Studio, adb, Xcode, Simulator

### Testing Steps
1. 安裝所需的 Python 套件：
    ```bash
    pip install -r requirements.txt
    ```

2. 開啟 Appium 的服務端口（以下兩種方式選擇其一）：
   - 使用 Appium 2.0：
     ```bash
     appium -pa /wd/hub -p {port} --use-plugins execute-driver
     ```
   - 使用 Appium 1.0：
     ```
     Appium DeskTop
     ```

3. 在終端執行 Robot Framework TestCase：
   - 執行單一 Robot 檔案：
     ```bash
     robot --variable devicename:<Device_Name> \
           --variable port:<Port> \
           --variable logcat:./tests/Android/log/<Device_Name> \
           -d ./tests/Android/log/<Device_Name> \
           <robotfilepath>
     ```

4. 執行特定TestCase或者TestSuite：
   - 在 Robot Framework 檔案中添加標籤 (tag)。
   - 使用 `--include` (`-i`) 或 `--exclude` (`-e`) 指定標籤：
     ```bash
     robot --variable devicename:<Device_Name> \
           --variable port:<Port> \
           --variable logcat:./tests/Android/log/<Device_Name> \
           -d ./tests/Android/log/<Device_Name> \
           -i regression <robotfilepath>
     ```

5. 執行特定優先級的TestCase：
   - 增加優先級標籤 (priority level) 至 Robot Framework。
   - 使用 `--include` (`-i`) 參數指定優先級：
     ```bash
     robot --variable devicename:<Device_Name> \
           --variable port:<Port> \
           --variable logcat:./tests/Android/log/<Device_Name> \
           -d ./tests/Android/log/<Device_Name> \
           -i {priority_level} <robotfilepath>
     ```
