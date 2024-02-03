
![Captura de tela de 2024-02-03 03-29-20](https://github.com/NettoNE/X11-anti-tearing/assets/93299326/ad5cc935-b694-40c9-a881-e5235f86ce1d)

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
