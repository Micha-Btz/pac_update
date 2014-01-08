#!/bin/bash
set -x

if [ "${android}" = "" ]; then
        android=~/handy/build/pacman
fi

cd ${android}/frameworks/av
# camera: Fix preview on SEMC msm7x30 devices
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/73/48673/3 && git checkout FETCH_HEAD
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/16/56416/1 && git checkout FETCH_HEAD

#Fixes secondary mic on semc devices
cd ${android}/hardware/qcom/audio-caf
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_qcom_audio-caf refs/changes/35/53435/6 && git checkout FETCH_HEAD

# libstagefright: extend support for disabling buffer metadata
cherries+=(56416)

#Fixes proximity sensor
cd ${android}/device/semc/mango
git revert a1230f0c3f0b7c3d95015142736e42229fcf5509

