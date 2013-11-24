#!/bin/bash

if [ -f ~/bin/paths-10.2.sh ]; then
        source ~/bin/paths-10.2.sh
fi

if [ "${android}" = "" ]; then
        android=~/handy/build/pacman
fi

cd ${android}/frameworks/av
# camera: Fix preview on SEMC msm7x30 devices
#git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/73/48673/2 && git cherry-pick FETCH_HEAD
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/73/48673/3 && git checkout FETCH_HEAD
cd ${android}/hardware/ti/wlan
# wpa_supplicant_lib: add check for TI specific wpa_supplicant
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_ti_wlan refs/changes/07/52707/1 && git cherry-pick FETCH_HEAD

cd ${android}/hardware/libhardware_legacy
# wifi: remove p2p interface on supplicant stop
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_libhardware_legacy refs/changes/30/52530/1 && git cherry-pick FETCH_HEAD

cd ${android}/hardware/ti/wpan
# Clean up makefiles
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_ti_wpan refs/changes/08/52708/1 && git cherry-pick FETCH_HEAD
# wpan: fix build issues
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_ti_wpan refs/changes/09/52709/1 && git cherry-pick FETCH_HEAD
# Squashed update of kfmapp from d-jb-mr1-release
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_ti_wpan refs/changes/11/52711/1 && git cherry-pick FETCH_HEAD
# Squashed update of FM app from d-jb-mr1-release
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_ti_wpan refs/changes/12/52712/1 && git cherry-pick FETCH_HEAD
# ti-wpan-fm-products.mk: Adding the product packages required for FM
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_ti_wpan refs/changes/13/52713/1 && git cherry-pick FETCH_HEAD

#Fixes secondary mic on semc devices
cd ${android}/hardware/qcom/audio-caf
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_qcom_audio-caf refs/changes/35/53435/4 && git checkout FETCH_HEAD
