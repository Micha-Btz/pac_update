#!/bin/bash
set -x

if [ "${android}" = "" ]; then
        android=~/handy/build/pacman
fi

cd ${android}/frameworks/av
# camera: Fix preview on SEMC msm7x30 devices
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/73/48673/3 && git checkout FETCH_HEAD

#Fixes secondary mic on semc devices
cd ${android}/hardware/qcom/audio-caf
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_qcom_audio-caf refs/changes/35/53435/5 && git checkout FETCH_HEAD

#mdpi: Override only the required dimensions
cd ${android}/frameworks/base
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_base refs/changes/53/54753/1 && git checkout FETCH_HEAD

