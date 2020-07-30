# Release name
PRODUCT_RELEASE_NAME := j1mini3g

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/j1mini3g/device_j1mini3g.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := j1mini3g
PRODUCT_NAME := lineage_j1mini3g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-J105H
PRODUCT_MANUFACTURER := samsung
