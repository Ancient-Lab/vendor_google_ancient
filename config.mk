ifeq ($(TARGET_G_ARCH),)
$(error "GAPPS: TARGET_G_ARCH is undefined")
endif

ifneq ($(TARGET_G_ARCH),arm64)
$(error "GOOGLE: Only arm64 is allowed")
endif

# app
PRODUCT_PACKAGES += \
    CalculatorGooglePrebuilt \
    CalendarGooglePrebuilt \
    Chrome \
    CloudPrint2 \
    Drive \
    FaceLock \
    GoogleCalendarSyncAdapter \
    GoogleContactsSyncAdapter \
    GoogleExtShared \
    GooglePrintRecommendationService \
    GoogleTTS \
    GoogleVrCore \
    LatinIMEGooglePrebuilt \
    Maps \
    MarkupGoogle \
    NexusLauncherIcons \
    Photos \
    PlayGames \
    PrebuiltBugle \
    PrebuiltDeskClockGoogle \
    PrebuiltExchange3Google \
    PrebuiltGmail \
    SoundPickerPrebuilt \
    talkback \
    WallpaperPickerGooglePrebuilt \
    WallpapersUsTwo \
    WebViewStub

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_BLACK),true)
     PRODUCT_COPY_FILES += vendor/google/ion/media/bootanimation.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/google/ion/media/bootanimation_720.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/google/ion/media/bootanimation_1080.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/google/ion/media/bootanimation_1440.zip:system/media/bootanimation.zip
else
     $(warning "TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
     PRODUCT_COPY_FILES += vendor/google/ion/media/bootanimation_1080.zip:system/media/bootanimation.zip
endif

# etc
PRODUCT_COPY_FILES += \
    vendor/google/ion/etc/default-permissions/com.android.providers.weather.xml:system/etc/default-permissions/com.android.providers.weather.xml \
    vendor/google/ion/etc/default-permissions/default-permissions.xml:system/etc/default-permissions/default-permissions.xml \
    vendor/google/ion/etc/default-permissions/google-permissions.xml:system/etc/default-permissions/google-permissions.xml \
    vendor/google/ion/etc/permissions/com.android.providers.weather.xml:system/etc/permissions/com.android.providers.weather.xml \
    vendor/google/ion/etc/permissions/com.google.android.dialer.support.xml:system/etc/permissions/com.google.android.dialer.support.xml \
    vendor/google/ion/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    vendor/google/ion/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \
    vendor/google/ion/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    vendor/google/ion/etc/permissions/org.pixelexperience.ambient.play.xml:system/etc/permissions/org.pixelexperience.ambient.play.xml \
    vendor/google/ion/etc/permissions/privapp-permissions-google.xml:system/etc/permissions/privapp-permissions-google.xml \
    vendor/google/ion/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml \
    vendor/google/ion/etc/sysconfig/google.xml:system/etc/sysconfig/google.xml \
    vendor/google/ion/etc/sysconfig/google_build.xml:system/etc/sysconfig/google_build.xml \
    vendor/google/ion/etc/sysconfig/google_exclusives_enable.xml:system/etc/sysconfig/google_exclusives_enable.xml \
    vendor/google/ion/etc/sysconfig/google-hiddenapi-package-whitelist.xml:system/etc/sysconfig/google-hiddenapi-package-whitelist.xml \
    vendor/google/ion/etc/sysconfig/pixel.xml:system/etc/sysconfig/pixel.xml

# fonts
PRODUCT_COPY_FILES += \
    vendor/google/ion/fonts/GoogleSans-Regular.ttf:system/fonts/GoogleSans-Regular.ttf \
    vendor/google/ion/fonts/GoogleSans-Medium.ttf:system/fonts/GoogleSans-Medium.ttf \
    vendor/google/ion/fonts/GoogleSans-MediumItalic.ttf:system/fonts/GoogleSans-MediumItalic.ttf \
    vendor/google/ion/fonts/GoogleSans-Italic.ttf:system/fonts/GoogleSans-Italic.ttf \
    vendor/google/ion/fonts/GoogleSans-Bold.ttf:system/fonts/GoogleSans-Bold.ttf \
    vendor/google/ion/fonts/GoogleSans-BoldItalic.ttf:system/fonts/GoogleSans-BoldItalic.ttf

ADDITIONAL_FONTS_FILE := vendor/google/ion/fonts/google-sans.xml

# framework
PRODUCT_PACKAGES += \
    com.google.android.dialer.support \
    com.google.android.maps \
    com.google.android.media.effects \
    com.google.widevine.software.drm

# include package overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/google/ion/overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/google/ion/overlay/common/

# libs
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,vendor/google/ion/lib,system/lib)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,vendor/google/ion/lib64,system/lib64)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,vendor/google/ion/usr,system/usr)

# priv-app
PRODUCT_PACKAGES += \
    AmbientPlayProvider \
    AndroidMigratePrebuilt \
    AndroidPlatformServices \
    ConfigUpdater \
    GoogleBackupTransport \
    GoogleContacts \
    GoogleDialer \
    GoogleExtServices \
    GoogleFeedback \
    GoogleOneTimeInitializer \
    GooglePartnerSetup \
    GoogleRestore \
    GoogleServicesFramework \
    MatchmakerPrebuilt \
    Phonesky \
    PixelLauncher \
    PrebuiltGmsCorePi \
    SetupWizard \
    StorageManagerGoogle \
    TagGoogle \
    TimeZoneDataPrebuilt \
    Velvet \
    WellbeingPrebuilt

# props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wallpapers_loc_request_suw=true \
    ro.com.google.ime.theme_id=5
