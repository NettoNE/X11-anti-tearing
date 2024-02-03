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

## Problems:

* If you get a black screen, acess a [tty](https://www.howtogeek.com/428174/what-is-a-tty-on-linux-and-how-to-use-the-tty-command/#accessing-a-tty), enter the directory ```/etc/X11/xorg.conf.d/```
and delete ```20-intel.conf```

* Try alternative script configuration with ```-alt``` flag

