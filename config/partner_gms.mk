ifeq ($(WITH_GMS),true)
    # Special handling for Android TV
    ifeq ($(PRODUCT_IS_ATV),true)
        ifneq ($(GMS_MAKEFILE),)
            # Specify the GMS makefile you want to use, for example:
            #   - arm
            #   - arm64
            $(call inherit-product, vendor/gapps/tv/$(GMS_MAKEFILE)/$(GMS_MAKEFILE)-vendor.mk)
        else
            ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
                $(call inherit-product-if-exists, vendor/gapps/tv/arm64/arm64-vendor.mk)
            else
                $(call inherit-product-if-exists, vendor/gapps/tv/arm/arm-vendor.mk)
            endif
        endif
    else
        ifneq ($(GMS_MAKEFILE),)
            # Specify the GMS makefile you want to use, for example:
            #   - arm
            #   - arm64
            #   - x86
            #   - x86_64
            $(call inherit-product, vendor/gapps/$(GMS_MAKEFILE)/$(GMS_MAKEFILE)-vendor.mk)
        else
            ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
                $(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)
            else
                $(call inherit-product-if-exists, vendor/gapps/arm/arm-vendor.mk)
            endif
        endif
    endif
endif
