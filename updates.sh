#!/bin/bash
set -x

if [ "${android}" = "" ]; then
        android=~/handy/build/pacman
fi

cd ${android}/frameworks/av
# camera: Fix preview on SEMC msm7x30 devices
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/73/48673/3 && git checkout FETCH_HEAD

cd ${android}/hardware/ti/wpan
# Clean up makefiles
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_ti_wpan refs/changes/08/52708/1 && git cherry-pick FETCH_HEAD
# wpan: fix build issues
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_ti_wpan refs/changes/09/52709/1 && git cherry-pick FETCH_HEAD

#Fixes secondary mic on semc devices
cd ${android}/hardware/qcom/audio-caf
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_qcom_audio-caf refs/changes/35/53435/4 && git checkout FETCH_HEAD

