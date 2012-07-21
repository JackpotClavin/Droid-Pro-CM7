#!/system/bin/sh
# Hack to get the Voice Search button working
am start -a android.intent.action.MAIN -n com.google.android.voicesearch/.RecognitionActivity
