# Inherit common mobile Lineage stuff
$(call inherit-product, vendor/lineage/config/common.mk)

# Include AOSP audio files
include vendor/lineage/config/aosp_audio.mk

# Include Lineage audio files
include vendor/lineage/config/lineage_audio.mk

# Default notification/alarm sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Iapetus.ogg \
    ro.config.alarm_alert=Argon.ogg

# Apps
PRODUCT_PACKAGES += \
    Backgrounds \
    ExactCalculator \
    GlimpsePrebuilt \
    MulchPrebuilt

ifeq ($(PRODUCT_TYPE), go)
PRODUCT_PACKAGES += \
    TrebuchetQuickStepGo

PRODUCT_DEXPREOPT_SPEED_APPS += \
    TrebuchetQuickStepGo
else
PRODUCT_PACKAGES += \
    TrebuchetQuickStep

PRODUCT_DEXPREOPT_SPEED_APPS += \
    TrebuchetQuickStep
endif

PRODUCT_PACKAGES += \
    TrebuchetOverlay

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

ifneq ($(WITH_LINEAGE_CHARGER),false)
PRODUCT_PACKAGES += \
    lineage_charger_animation \
    lineage_charger_animation_vendor
endif

# Customizations
PRODUCT_PACKAGES += \
    ExtraNavigationBarNoHintKeyboard \
    IconPackCircularAndroidOverlay \
    IconPackCircularLauncherOverlay \
    IconPackCircularSettingsOverlay \
    IconPackCircularSystemUIOverlay \
    IconPackFilledAndroidOverlay \
    IconPackFilledLauncherOverlay \
    IconPackFilledSettingsOverlay \
    IconPackFilledSystemUIOverlay \
    IconPackKaiAndroidOverlay \
    IconPackKaiLauncherOverlay \
    IconPackKaiSettingsOverlay \
    IconPackKaiSystemUIOverlay \
    IconPackRoundedAndroidOverlay \
    IconPackRoundedLauncherOverlay \
    IconPackRoundedSettingsOverlay \
    IconPackRoundedSystemUIOverlay \
    IconPackSamAndroidOverlay \
    IconPackSamLauncherOverlay \
    IconPackSamSettingsOverlay \
    IconPackSamSystemUIOverlay \
    IconPackVictorAndroidOverlay \
    IconPackVictorLauncherOverlay \
    IconPackVictorSettingsOverlay \
    IconPackVictorSystemUIOverlay \
    IconShapePebbleOverlay \
    IconShapeRoundedRectOverlay \
    IconShapeSquareOverlay \
    IconShapeSquircleOverlay \
    IconShapeTaperedRectOverlay \
    IconShapeTeardropOverlay \
    IconShapeVesselOverlay \
    LineageNavigationBarNoHint \
    NavigationBarMode2ButtonOverlay

# Enable whole-program R8 Java optimizations for SystemUI, but also
# allow explicit overriding for testing and development.
SYSTEMUI_OPTIMIZE_JAVA ?= true

# Face Unlock
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
TARGET_FACE_UNLOCK_SUPPORTED ?= true

ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    ParanoidSense

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service.enabled=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif
endif

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# Themes
PRODUCT_PACKAGES += \
    LineageBlackTheme \
    ThemePicker \
    ThemesStub

PRODUCT_PACKAGE_OVERLAYS += vendor/lineage/overlay/mobile
