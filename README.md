
![script_screenshot](https://github.com/NettoNE/X11-anti-tearing/assets/93299326/3b9ff79f-4187-48f6-91fa-3de82cde5efe)


## How to use:

### Give execution permission
```bash 
chmod +x anti-tearing.sh
```

### Execute with `sudo`
```bash
sudo anti-tearing.sh
```

**Restart after configuration...**

## How to know the intel driver version

You can use: 

```bash
sudo lspci -k | grep -EA3 'VGA|3D|Display'
```

**OR**

```bash 
# inxi may not be standard on your distribution, install using the package manager
inxi -G
``` 

## Problems:

* If you get a black screen, acess a [tty](https://www.howtogeek.com/428174/what-is-a-tty-on-linux-and-how-to-use-the-tty-command/#accessing-a-tty), enter the directory ```/etc/X11/xorg.conf.d/```
and delete ```20-intel.conf```

* Try alternative script configuration with ```-alt``` flag
