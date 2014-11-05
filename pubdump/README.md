Configuration example and a small publish script for my "dumphost".

The idea is that the root folder is not indexed but there can be collections in subfolders that are autoindexed.
These collections should have then hard-to-guess names of course!

As this host only allows sftp access (and to be honest, more is not needed to publish and manage published files) I wrote a small script to easily upload files to new collections.

If only one directory is specified, its content will get published directly into the new collection.

# Example

```bash
pubdump git:(master) ./pubdump.sh *
# Connected to web01.futw.eu.
# sftp> cd /srv/kcirtap.de/htdocs/dump/
# sftp> mkdir teghaethamoowait
# sftp> cd teghaethamoowait
# sftp> put 200-dump.kcirtap.de.conf
# Uploading 200-dump.kcirtap.de.conf to /srv/kcirtap.de/htdocs/dump/teghaethamoowait/200-dump.kcirtap.de.conf
# 200-dump.kcirtap.de.conf                                                                                    100%  162     0.2KB/s   00:00    
# sftp> put pubdump.sh
# Uploading pubdump.sh to /srv/kcirtap.de/htdocs/dump/teghaethamoowait/pubdump.sh
# pubdump.sh                                                                                                  100%  453     0.4KB/s   00:00    
# sftp> put README.md
# Uploading README.md to /srv/kcirtap.de/htdocs/dump/teghaethamoowait/README.md
# README.md                                                                                                   100%  576     0.6KB/s   00:00    
# The files were dumped for key teghaethamoowait
# have a look: https://dump.kcirtap.de/teghaethamoowait
```
