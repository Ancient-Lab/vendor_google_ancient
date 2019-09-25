LOCAL_PATH := vendor/google/ion

ifeq ($(TARGET_GAPPS_ARCH),)
$(error "GAPPS: TARGET_GAPPS_ARCH is undefined")
endif

ifneq ($(TARGET_GAPPS_ARCH),arm64)
$(error "GAPPS: Only arm64 is allowed")
endif

# app
PRODUCT_PACKAGES += \
    CalculatorGooglePrebuilt \
    CalendarGooglePrebuilt \
    Chrome \
    Drive \
    EmergencyInfoGoogleNoUi \
    GoogleContactsSyncAdapter \
    GoogleTTS \
    LatinIMEGooglePrebuilt \
    LocationHistoryPrebuilt \
    Maps \
    MarkupGoogle \
    Photos \
    PlayGames \
    PrebuiltBugle \
    PrebuiltDeskClockGoogle \
    PrebuiltGmail \
    SoundPickerPrebuilt \
    talkback \
    TrichromeLibrary \
    WallpaperPickerGooglePrebuilt \
    WallpapersUsTwo \
    WebViewGoogle

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/media/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/media/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/media/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH)/media/bootanimation-dark_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/media/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/media/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
endif

# files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/etc,$(TARGET_COPY_OUT_PRODUCT)/etc)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/media/audio,$(TARGET_COPY_OUT_PRODUCT)/media/audio)

# framework
PRODUCT_PACKAGES += \
    com.google.android.dialer.support \
    com.google.android.maps

# include package overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay/common/

# libs
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/lib,$(TARGET_COPY_OUT_PRODUCT)/lib)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/lib64,$(TARGET_COPY_OUT_PRODUCT)/lib64)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/usr,$(TARGET_COPY_OUT_PRODUCT)/usr)

# priv-app
PRODUCT_PACKAGES += \
    AndroidMigratePrebuilt \
    AndroidPlatformServices \
    ConfigUpdater \
    ConnMetrics \
    GoogleContacts \
    GoogleDialer \
    GoogleFeedback \
    GooglePartnerSetup \
    GoogleServicesFramework \
    MatchmakerPrebuilt \
    Phonesky \
    PixelLauncher \
    PixelSetupWizard \
    PrebuiltGmsCoreQt \
    SafetyHubPrebuilt \
    SettingsIntelligenceGooglePrebuilt \
    SetupWizardPrebuilt \
    TipsPrebuilt \
    TurboPrebuilt \
    Velvet \
    WellbeingPrebuilt

# props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wallpapers_loc_request_suw=true \
    ro.com.google.ime.theme_id=5
