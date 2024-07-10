# Inherit common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_mobile.mk)

PRODUCT_SIZE := full

# Include {Lato,Rubik} fonts and extra fonts
$(call inherit-product-if-exists, external/fonts-extra/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/lato/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/rubik/fonts.mk)

# Apps
PRODUCT_PACKAGES += \
    Eleven \
    Etar \
    Profiles \
    QrCodeScanner \
    Recorder \
    Seedvault

ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd

# Fonts
PRODUCT_PACKAGES += \
    fonts_customization.xml \
    FontFiraSansOverlay \
    FontFredokaOverlay \
    FontGoogleSansOverlay \
    FontInterOverlay \
    FontLatoOverlay \
    FontOPlusSansOverlay \
    FontRubikOverlay
