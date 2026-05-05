#!/bin/bash
echo "========================================"
echo " JARVIS APK Builder"
echo "========================================"
chmod +x gradlew
./gradlew assembleDebug
if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo " SUCCESS! APK is at:"
    echo " app/build/outputs/apk/debug/app-debug.apk"
    echo "========================================"
else
    echo "BUILD FAILED. Check errors above."
fi
