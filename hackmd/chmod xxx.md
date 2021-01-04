# chmod xxx

## 使用方式
XXX 三個數字以八進位分別表示 `(U)ser`/`(G)roup`/`(O)thers` 個別 `Read/Write/Execute` 權限.  

```shell=
chmod xxx file_name
chmod -R xxx folder_name
```

## 常用組合對照表
|code | for file | for folder|
|--- | --- | ---|
|777 | -rwxrwxrwx | drwxrwxrwx|
|755 | -rwxr-xr-x | drwxr-xr-x|
|775 | -rwxrwxr-x | drwxrwxr-x|
|644 | -rw-r--r-- | drw-r--r--|
|600 | -rw------- | drw-------|
|700 | -rwx------ | drwx------|
|666 | -rw-rw-rw- | drw-rw-rw-|
|400 | -r-------- | dr--------|
|664 | -rw-rw-r-- | drw-rw-r--|
|744 | -rwxr--r-- | drwxr--r--|
|770 | -rwxrwx--- | drwxrwx---|
|444 | -r--r--r-- | dr--r--r--|
|555 | -r-xr-xr-x | dr-xr-xr-x|

## 補充

### [Is there any difference between mode value 0777 and 777](https://unix.stackexchange.com/a/103414)

> Just to be clear -- the value you pass to the chmod command is always interpreted as octal. Using chmod 888 will give an error. – mattdm Dec 2 '13 at 20:45

核心差別就是一個表示`八進位(octal)`一個表示`十進位(decimal)`的數字.

## 參考
- [Chmod Calculator](https://chmodcommand.com/)