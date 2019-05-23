# Netgear DM200 Transparent ADSL/VDSL Bridge

## Files for OpenWRT Image Builder, pre-configured for UK ISPs.

This firmware when built and flashed to the Netgear DM200, will make it operate in a transparent bridge mode, where it will auto-configure to either ADSL or VDSL, depending on what is detected on the line.

## Networking Setup

The internet connection from the ISP is always bridged directly to the ethernet port, untagged (you don't need to specify VLAN 101 for FTTC, this is handled internally), allowing you to do PPPoE or just DHCP directly on your ethernet router, depending on the connection type from your ISP.

### Management Interface (VLAN 2)

As well as the connection bridge, we also expose a management network on VLAN 2, allowing you to access connection status, or manage the modem (SSH, Luci, firmware flash, etc).

Modem network settings for VLAN 2 :

```
IP Address:            172.16.2.250
Network Mask:          255.255.255.0

Expected router IP:    172.16.2.254
```

Services exposed:

```
SSH (port 22):               root@172.16.2.250

Web:
    Status Overview page:    http://172.16.2.250/
    Status JSON feed:        http://172.16.2.250/cgi-bin/luci/a1comms/status/json
    Luci Web Admin Panel:    http://172.16.2.250/cgi-bin/luci
```

## Usage & Build

### Building

To build from these files, you'll need to copy everything from this repo into your extracted image builder folder, but before you build, you'll need to add the Lantiq firmware for the internal modem.

This can be obtained from: `https://xdarklight.github.io/lantiq-xdsl-firmware-info/`

The version you are looking for us `5.7.B.5.0.7-5.7.5.4.0.1`, which should give you the file `dsl_vr9_firmware_xdsl-05.07.0B.05.00.07_05.07.05.04.00.01.bin`.

Please place that file at `files/lib/firmware/dsl_vr9_firmware_xdsl-05.07.0B.05.00.07_05.07.05.04.00.01.bin`.

You should now be able to run `./build.sh` in the root to build the images.

### Flashing

To flash, you'll need to use the standard firmware upgrade methods, either for the stock firmware, or inside Luci if you've already flashed a previous version.

If flashing from the stock firmware, use the file ending in "-factory.img".

If flashing from a previous version, use the file ending "-sysupgrade.bin".