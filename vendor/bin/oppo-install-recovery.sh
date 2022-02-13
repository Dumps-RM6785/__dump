#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:464bae7052f7fd9b90abe77ac9f363756ea29aad; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:de9f20ef843e4bf53824f5198589c6602a540de3 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:464bae7052f7fd9b90abe77ac9f363756ea29aad && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
