ccache -M 50G
export USE_CCACHE=1
export SKIP_ABI_CHECKS=true

git clone --depth=1 https://github.com/kdrag0n/proton-clang.git prebuilts/clang/host/linux-x86/clang-proton
git revert 6ab36bd --no-edit
