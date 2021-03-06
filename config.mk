LOCAL_PATH := vendor/google/ancient
LOCAL_PATH_PRODUCT := vendor/google/ancient/product

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
    NgaResources \
    Photos \
    PixelThemes \
    PrebuiltBugle \
    PrebuiltDeskClockGoogle \
    PrebuiltGmail \
    SoundPickerPrebuilt \
    talkback \
    WallpapersUsTwo \
    WebViewGoogle

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += $(LOCAL_PATH_PRODUCT)/media/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH_PRODUCT)/media/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += $(LOCAL_PATH_PRODUCT)/media/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
     PRODUCT_COPY_FILES += $(LOCAL_PATH_PRODUCT)/media/bootanimation-dark_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += $(LOCAL_PATH_PRODUCT)/media/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
    PRODUCT_COPY_FILES += $(LOCAL_PATH_PRODUCT)/media/bootanimation-dark_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation-dark.zip
endif

# files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/etc,$(TARGET_COPY_OUT_SYSTEM)/etc)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH_PRODUCT)/etc,$(TARGET_COPY_OUT_PRODUCT)/etc)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH_PRODUCT)/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH_PRODUCT)/media/audio,$(TARGET_COPY_OUT_PRODUCT)/media/audio)

# framework
PRODUCT_PACKAGES += \
    com.google.android.dialer.support \
    com.google.android.maps

# include package overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay/common/

# libs
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH_PRODUCT)/lib,$(TARGET_COPY_OUT_PRODUCT)/lib)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH_PRODUCT)/lib64,$(TARGET_COPY_OUT_PRODUCT)/lib64)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH_PRODUCT)/usr,$(TARGET_COPY_OUT_PRODUCT)/usr)

# overlays
PRODUCT_PACKAGES += \
    PixelDocumentsUIGoogleOverlay \
    GooglePermissionControllerOverlay

# priv-app
PRODUCT_PACKAGES += \
    AndroidMigratePrebuilt \
    AndroidPlatformServices \
    ConfigUpdater \
    ConnMetrics \
    GoogleContacts \
    GoogleDialer \
    GoogleDocumentsUIPrebuilt \
    GoogleFeedback \
    GooglePackageInstaller \
    GooglePartnerSetup \
    GooglePermissionControllerPrebuilt \
    GoogleServicesFramework \
    MatchmakerPrebuilt \
    Phonesky \
    PixelLauncher \
    PixelSetupWizard \
    PrebuiltGmsCoreQt \
    RecorderPrebuilt \
    SafetyHubPrebuilt \
    SettingsIntelligenceGooglePrebuilt \
    SetupWizardPrebuilt \
    TipsPrebuilt \
    TurboPrebuilt \
    Velvet \
    WallpaperPickerGoogleRelease \
    WellbeingPrebuilt

# props
# SetupWizard
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.theme=glif_v3_light

# Gestures
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural

# IME
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.system_lm_dir=/system/product/usr/share/ime/google/d3_lms \
    ro.wallpapers_loc_request_suw=true \
    ro.com.google.ime.theme_id=5
