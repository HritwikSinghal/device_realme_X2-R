ccache -M 50G
export USE_CCACHE=1
export SKIP_ABI_CHECKS=true

git clone --depth=1 https://github.com/kdrag0n/proton-clang.git prebuilts/clang/host/linux-x86/clang-proton
git revert 6ab36bd --no-edit

rm -rf hardware/qcom-caf/sm8150/audio
rm-rf hardware/qcom-caf/sm8150/display
rm -rf hardware/qcom-caf/sm8150/media

git clone https://github.com/LineageOS/android_hardware_qcom_audio -b lineage-19.1-caf-sm8150 hardware/qcom-caf/sm8150/audio
git clone https://github.com/LineageOS/android_hardware_qcom_display -b lineage-19.1-caf-sm8150 hardware/qcom-caf/sm8150/display
git clone https://github.com/LineageOS/android_hardware_qcom_media -b lineage-19.1-caf-sm8150 hardware/qcom-caf/sm8150/media
