# WoW Key Repeat + Overlay System
Two AutoHotkey v1 scripts working together to provide:

- 🔁 Automatic key repeating inside World of Warcraft  
- 🟩/🟥 A minimal overlay that shows whether the script is **Running (R)** or **Suspended (S)**  
- 💾 Persistent overlay position & lock state  
- 📋 Real-time communication through a shared log file  

---

# 🚀 How to Use

## 1. Setup
1. Install **AutoHotkey v1**.
2. Place the scripts anywhere you like:
   - `wow_key_repeat_with_log.ahk`
   - `wow_key_repeat_script_monitor_overlay.ahk`

## 2. Running manually
1. Start **wow_key_repeat_with_log.ahk**.
2. Start **wow_key_repeat_script_monitor_overlay.ahk**.
3. Launch **World of Warcraft**.
4. The overlay appears automatically when WoW is active.

## 3. 🔧 Recommended: Start overlay automatically via Task Scheduler
This avoids timing issues at startup and ensures the overlay always loads correctly.

### Steps
1. Open **Task Scheduler**
2. Click **Create Task…**
3. **General tab**
   - Name: `WoW Overlay`
   - Check: **Run only when user is logged on**
   - (Optional) Check: **Run with highest privileges**
4. **Triggers tab**
   - New → Begin task: **At log on**
   - Check **Delay task for:** → choose **10–30 seconds**
5. **Actions tab**
   - New → Action: **Start a program**
   - Program: Path to your `AutoHotkey.exe`
   - Arguments: `"C:\Path\To\wow_overlay.ahk"`
6. Save task  
7. Remove the overlay from the Startup folder if present.

> **Why Task Scheduler?**  
> It prevents race conditions during Windows startup and ensures the overlay always appears.

---

# 🖥 Overlay Guide

## What the overlay shows
- **R (green)** → key repeat script is running  
- **S (red)** → key repeat script is suspended  

## When it appears
Overlay is visible only when:

- World of Warcraft is **running**, and  
- WoW **or the overlay itself** is the active window  

## Lock / unlock
- **Locked overlay**
  - Semi-transparent
  - Click-through
  - Cannot be dragged
- **Unlocked overlay**
  - Fully opaque
  - Draggable  
  - Right-click overlay **or** tray icon → Toggle Lock

---

# 🔁 Key Repeat Script

## Purpose
- Repeats keys while held down in WoW  
- Toggles suspended/unsuspended  
- Logs state changes to `suspend_log.txt`

## Log file example
```
2025-01-12 14:33:21 suspended
2025-01-12 14:33:40 unsuspended
```

Overlay reads only the *last* line.

---

# 📁 Settings & File Locations

### Key repeat script folder
```
<YourFolder>\
    key_repeat.ahk
    suspend_log.txt
```

### Overlay settings folder
```
%AppData%\WoWScriptOverlay\
    overlay_settings.ini
```

Example:
```
[Overlay]
X=769
Y=1307
Locked=1
```

### Overlay script folder
```
<YourFolder>\
    wow_overlay.ahk
```

---

# 🔗 How the scripts interact

1. Key repeat script logs state changes.  
2. Overlay detects if WoW is active.  
3. Overlay checks last log entry:
   - `unsuspended` → 🟩 R  
   - `suspended` → 🟥 S  
4. Overlay hides when WoW is not active.  
5. Exiting overlay:
   - Saves position  
   - Saves lock state  
   - Deletes `suspend_log.txt`  

---

# ⚙️ Performance

- Both scripts consume **negligible CPU**  
- Overlay checks once per second  
- No measurable impact on WoW performance  

---

If you want, I can also generate a PDF, ZIP package, or add screenshots.
