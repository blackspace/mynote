sudo去掉密码
-----------------------------------------------------------

```
apple@apple-System:/etc/sudoers.d$ sudo cat apple_nopasswd 
apple ALL=(ALL)NOPASSWD:ALL
```

查看分区uuid
---------------------------------

```
apple@apple-System:~$ sudo blkid
/dev/sda1: LABEL="apple-home" UUID="7d03af4c-d0b6-412e-b643-e82bc8bb05d7" TYPE="ext4" PARTUUID="1ab232f2-ee5b-4676-b6d9-45f091074f83"
/dev/sda2: LABEL="DOCUMENT" UUID="63E04AE37F33E029" TYPE="ntfs" PARTUUID="7e62f1a0-ae5b-4e95-b8cf-d2af8f4ae371"
/dev/sda3: LABEL="BACKUP" UUID="F27869727869370F" TYPE="ntfs" PARTLABEL="Basic data partition" PARTUUID="25c9bfd8-6b44-41f6-8b59-d79558637850"
/dev/sda4: PARTUUID="fc86ae0b-3872-46fc-b6cb-f93226ae3f44"
/dev/sda5: UUID="fb6fe3f2-097e-46df-8438-905cd18eb865" TYPE="xfs" PARTUUID="5a80b019-573a-47cf-9fb5-ccf3d936073e"
/dev/sda6: UUID="86HrqC-h83L-TRIx-HF1x-AjFL-83ce-0UCAe8" TYPE="LVM2_member" PARTUUID="5e51139b-4a35-4955-88fe-b6438971629d"
/dev/sdb1: LABEL="WIN7" UUID="6EF845A3F8456A83" TYPE="ntfs" PARTUUID="9262a881-01"
/dev/sdb2: UUID="b89209b5-5041-4029-9fcc-b87e2c10df7b" TYPE="ext4" PARTUUID="9262a881-02"
/dev/sdb3: UUID="5d9ccd63-aefd-4ea5-9ca7-2eb5b50b3c43" TYPE="swap" PARTUUID="9262a881-03"
apple@apple-System:~$ 
```