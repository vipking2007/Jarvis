╔══════════════════════════════════════════════╗
║         JARVIS APK — Build Instructions      ║
╚══════════════════════════════════════════════╝

WHAT THIS IS
─────────────
A real native Android app (.apk) that runs JARVIS in a WebView
with a background service for always-on "Hey JARVIS" wake word —
even when the app is closed.

═══════════════════════════════════════════════
STEP 1 — INSTALL REQUIREMENTS (one time only)
═══════════════════════════════════════════════

1. Install JDK 17
   → https://adoptium.net
   → Download "Temurin 17 LTS" for your OS
   → Install it

2. Install Android Studio
   → https://developer.android.com/studio
   → Install with default settings
   → Open it once so it downloads the Android SDK

3. Set ANDROID_HOME environment variable
   Windows: set ANDROID_HOME=C:\Users\YOU\AppData\Local\Android\Sdk
   Mac/Linux: export ANDROID_HOME=$HOME/Android/Sdk  (add to ~/.bashrc)

═══════════════════════════════════════════════
STEP 2 — BUILD THE APK
═══════════════════════════════════════════════

Windows:
  Double-click BUILD_WINDOWS.bat
  — OR —
  Open a terminal in this folder and run: gradlew.bat assembleDebug

Mac / Linux:
  Open a terminal in this folder and run:
  chmod +x gradlew && ./gradlew assembleDebug

First build downloads Gradle (~100MB) and takes 3–5 minutes.
Subsequent builds take ~30 seconds.

═══════════════════════════════════════════════
STEP 3 — INSTALL ON YOUR PHONE
═══════════════════════════════════════════════

APK location after build:
  app/build/outputs/apk/debug/app-debug.apk

To install:
  1. Enable "Install unknown apps" on your phone:
     Settings → Security → Install unknown apps → allow your file manager
  2. Copy app-debug.apk to your phone (USB, Google Drive, WhatsApp, etc.)
  3. Open the APK on your phone → tap Install
  4. Open JARVIS → grant mic permission → enter your OpenRouter key

═══════════════════════════════════════════════
WAKE WORD FEATURES IN THE NATIVE APK
═══════════════════════════════════════════════

✅ Always-on background listening via Android SpeechRecognizer
✅ Works when app is minimized or screen is on standby
✅ Persistent foreground notification (required by Android)
✅ Auto-restarts after reboot (BootReceiver)
✅ Says "Hey JARVIS" or just "JARVIS" to activate
✅ Inline commands: "Hey JARVIS what time is it" works in one shot

═══════════════════════════════════════════════
TROUBLESHOOTING
═══════════════════════════════════════════════

"ANDROID_HOME not set"
  → Set it as described in Step 1

"SDK not found"
  → Open Android Studio → SDK Manager → install Android 14 (API 34)

"Permission denied on gradlew"
  → Run: chmod +x gradlew

Build succeeds but wake word doesn't work in background:
  → Go to phone Settings → Apps → JARVIS → Battery → set to "Unrestricted"
  → This prevents Android from killing the background service

═══════════════════════════════════════════════
WANT A RELEASE APK? (for sharing)
═══════════════════════════════════════════════

Run: gradlew assembleRelease
Then sign it: https://developer.android.com/studio/publish/app-signing
