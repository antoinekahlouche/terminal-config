# MacOS conf

**Disable automatic back up of iOS devices**

```bash
defaults write com.apple.AMPDevicesAgent.plist AutomaticDeviceBackupsDisabled -bool true
```

**Speed-up desktop transition**

...

**Disable sleep on external disks**

```bash
sudo pmset -a disksleep 0

# verify
pmset -g
```

**Disable macOS sleep**

```bash
sudo pmset sleep 0
```

**Disable Spotlight on external HDD/SSD**

```bash
sudo mdutil -a off
```
