ccache -M 50G
export USE_CCACHE=1
export SKIP_ABI_CHECKS=true

git clone --depth=1 https://github.com/kdrag0n/proton-clang.git prebuilts/clang/host/linux-x86/clang-proton
git revert 6ab36bd --no-edit

# HACK: libcameraservice: Make system cameras available to all camera apps
git -C ./platform/frameworks/av remote add patch https://github.com/ProjectStreak/platform_frameworks_av
git -C ./platform/frameworks/av fetch patch --depth=1
git -C ./platform/frameworks/av cherry-pick 56cfebda660a124ff15cf6d5b44cee9fde9bd446


# BasebandVersionPreferenceController: Trim baseband if needed
git -C ./packages/apps/Settings remote add patch https://github.com/ProjectStreak/platform_packages_apps_Settings
git -C ./packages/apps/Settings fetch patch --depth=1
git -C ./packages/apps/Settings cherry-pick b0c6da523976d62ace5eb67094d17095a94dc6da

# fixup! BiometricScheduler: Cancel operation if not idle
git -C ./frameworks/base remote add patch https://github.com/ProjectStreak/platform_frameworks_base
git -C ./frameworks/base fetch patch --depth=1
git -C ./frameworks/base cherry-pick eb6e46084d6600fa0952591da62258807565f892


# Revert "libsepol: Make an unknown permission an error in CIL"
git -C ./external/selinux remote add patch https://github.com/hritwiksinghal/selinux_patch
git -C ./external/selinux fetch patch
git -C ./external/selinux cherry-pick a2519ea17318d47224cc82b7544620e93af6a03c



rm -rf hardware/qcom-caf/sm8150/audio
rm-rf hardware/qcom-caf/sm8150/display
rm -rf hardware/qcom-caf/sm8150/media

git clone https://github.com/LineageOS/android_hardware_qcom_audio -b lineage-19.1-caf-sm8150 hardware/qcom-caf/sm8150/audio
git clone https://github.com/LineageOS/android_hardware_qcom_display -b lineage-19.1-caf-sm8150 hardware/qcom-caf/sm8150/display
git clone https://github.com/LineageOS/android_hardware_qcom_media -b lineage-19.1-caf-sm8150 hardware/qcom-caf/sm8150/media
