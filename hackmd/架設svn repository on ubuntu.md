# 架設 svn repository on ubuntu


## 環境
- Ubuntu 20.04.1 LTS
- subversion/focal,now 1.13.0-3 amd64
- apache2-bin/focal-updates,focal-security,now 2.4.41-4ubuntu3.1 amd64 
- apache2-data/focal-updates,focal-security,now 2.4.41-4ubuntu3.1 all 
- apache2-utils/focal-updates,focal-security,now 2.4.41-4ubuntu3.1 amd64 
- apache2/focal-updates,focal-security,now 2.4.41-4ubuntu3.1 amd64 
- libapache2-mod-svn/focal,now 1.13.0-3 amd64

---

## 流程
```shell=
## 更新 apt
apt-get update

## 安裝 svn
apt install subversion

## 安裝 apache
apt-get install apache2

## 新增群組 for svn
addgroup subversion
## 將使用者 `www-data` 加入剛創好的使用者群組
adduser www-data subversion

## 選定放 SVN repository 的位置, 這裡先假設放在 `/home/svn`
mkdir /home/svn
## 建立測試用專案, 這裡假設為 `test_project`
svnadmin create /home/svn/test_project

## 調整資料夾權限
cd /home/svn/
chown -R www-data:subversion test_project/
chmod -R g+rws test_project/

## 安裝 svn mod for apache
apt-get install libapache2-mod-svn

## 修改 apache svn mod 設定, 沒有這檔案表示 `libapache2-mod-svn` 可能安裝失敗
vim /etc/apache2/mods-available/dav_svn.conf
## 加入的內容選擇請參考下文 [dav_svn.conf]

## 重啟 apache
/etc/init.d/apache2 restart

## 新增SVN使用者帳密
## 如果要新建 or 重建使用者資料庫的話, 加上 `-c`
htpasswd -c /etc/subversion/passwd user_a

## 新增使用者
htpasswd /etc/subversion/passwd user_b

## 確認使用者是否有正確加入, 這裡應該要列出你剛才加入的使用者和其加密過的密碼
cat /etc/subversion/passwd

## done
```

### dav_svn.conf 設定細節

#### location
`/etc/apache2/mods-available/dav_svn.conf`

#### 可瀏覽所有資料庫的設定
```
<Location /svn>
    DAV svn
    SVNParentPath /home/svn
    SVNListParentPath On
    AuthType Basic
    AuthName "Subversion Repository"
    AuthUserFile /etc/subversion/passwd
    Require valid-user
</Location>
```

#### 單獨開放某個資料庫的設定
```
<Location /svn/test_project>
    DAV svn
    SVNPath /home/svn/test_project
    AuthType Basic
    AuthName "test_project subversion repository"
    AuthUserFile /etc/subversion/passwd
    Require valid-user
</Location>
```

## 重開 apache
```shell=
/etc/init.d/apache2 restart
```

## 追加 repository
假設要追加一個 `dev` 的資料庫放在 `/home/dev`

### folder setup
```shell=
cd /home/svn/
svnadmin create dev
chown -R www-data:subversion dev/
chmod -R g+rws dev/
```

也可以寫成一個 function 方便使用
```shell=
function svn-add-repo() {
    ## 目標資料夾不存在才執行
    if [ ! -d $1 ]; then
        svnadmin create $1
        chown -R www-data:subversion $1/
        chmod -R g+rws $1/
    fi
}

svn-add-repo dev
```

### dav_svn.conf setup 
- 如果是採用 `SVNParentPath /home/svn` 這種授權方式, 這裡就不用特別改甚麼


## ref
- [Subversion](https://help.ubuntu.com/community/Subversion)
- [AddUsersHowto](https://help.ubuntu.com/community/AddUsersHowto)
- [FixShowAllUsers](https://help.ubuntu.com/community/FixShowAllUsers)
- [apt-get install libapache2-svn apache2 ... libapache2-svn not found
 0](https://www.linode.com/community/questions/17765/apt-get-install-libapache2-svn-apache2-libapache2-svn-not-found)