# Linux 簡易指令作弊表  
**（依三份講義：Ch2a、Ch2b、Ch3a 整理）**  
**講師：曾宇瑞**  
**適用：Rocky Linux / CentOS / 類 Unix 系統**

---

## 一、檔案檢視與內容分析
| 指令 | 功能 | 範例 |
|------|------|------|
| `cat` | 順序顯示檔案內容 | `cat /etc/passwd` |
| `tac` | 反向顯示檔案內容（最後一行變第一行） | `tac /var/log/messages` |
| `head -n 數字` | 顯示檔案前 N 行（預設 10 行） | `head -n 5 /etc/passwd` |
| `tail -n 數字` | 顯示檔案後 N 行（預設 10 行） | `tail -n 20 /var/log/auth.log` |
| `tail -f` | 即時監控檔案新增內容（常用於查看 log） | `tail -f /var/log/syslog` |
| `less` | 分頁瀏覽（可上下捲動，按 q 離開） | `less /var/log/messages` |
| `more` | 分頁瀏覽（僅往下，較舊工具） | `more /etc/fstab` |
| `grep "關鍵字"` | 搜尋文字（區分大小寫） | `grep "error" /var/log/syslog` |
| `grep -i` | 搜尋文字（不區分大小寫） | `grep -i "ERROR" /var/log/syslog` |
| `grep -E` | 使用擴展正則表達式 | `grep -E "error\|fail" /var/log/*.log` |
| `grep -r` | 遞迴搜尋整個目錄 | `grep -r "ssh" /var/log/` |
| `grep -n` | 顯示行號 | `grep -n "ssh" /var/log/auth.log` |
| `grep -v` | 反向搜尋（顯示不符合的行） | `grep -v "^#" /etc/fstab` |

---

## 二、檔案管理與操作
| 指令 | 功能 | 範例 |
|------|------|------|
| `cp 來源 目的地` | 複製檔案 | `cp file1.txt file2.txt` |
| `cp -r 來源 目的地` | 複製整個目錄（遞迴） | `cp -r dir1 dir2` |
| `cp -p` | 保留檔案屬性（權限、時間） | `cp -p original.txt backup.txt` |
| `mv 來源 目的地` | 移動檔案或目錄 | `mv file.txt /tmp/` |
| `mv 舊名 新名` | 重新命名檔案或目錄 | `mv old.txt new.txt` |
| `rm 檔案` | 刪除檔案 | `rm temp.txt` |
| `rm -r 目錄` | 遞迴刪除目錄及其內容 | `rm -r old_dir/` |
| `rm -rf 目錄` | 強制刪除（危險！不會詢問） | `rm -rf test_dir/` |
| `touch 檔案` | 建立空檔案或更新時間戳記 | `touch newfile.txt` |
| `> 檔案` | 清空檔案內容（保留檔案） | `> log.txt` |
| `mkdir 目錄` | 建立單層目錄 | `mkdir mydir` |
| `mkdir -p 路徑` | 建立多層目錄（自動建立父目錄） | `mkdir -p ~/project/src/utils` |

---

## 三、檔案搜尋與指令來源
| 指令 | 功能 | 範例 |
|------|------|------|
| `find 路徑 條件` | 依條件搜尋檔案 | `find /etc -name "*.conf"` |
| `find -name` | 依檔名搜尋（區分大小寫） | `find /home -name "report.txt"` |
| `find -iname` | 依檔名搜尋（不區分大小寫） | `find /home -iname "*.PDF"` |
| `find -type f` | 只搜尋檔案 | `find /var -type f -name "*.log"` |
| `find -type d` | 只搜尋目錄 | `find /home -type d -name "backup"` |
| `find -size +大小` | 搜尋大於指定大小的檔案 | `find . -size +10M` |
| `find -size -大小` | 搜尋小於指定大小的檔案 | `find /tmp -size -1k` |
| `find -mtime -天數` | 搜尋 N 天內修改的檔案 | `find ~ -mtime -7 -type f` |
| `find -mtime +天數` | 搜尋 N 天前修改的檔案 | `find /var/log -mtime +30` |
| `find -mmin -分鐘` | 搜尋 N 分鐘內修改的檔案 | `find /var/log -mmin -10` |
| `locate 檔名` | 快速搜尋（需先執行 updatedb） | `locate passwd` |
| `which 指令` | 顯示指令的完整路徑 | `which python3` |
| `type 指令` | 判斷是內建指令還是外部指令 | `type cd`（內建）、`type ls`（外部） |

---

## 四、環境變數與 Script
| 指令 | 功能 | 範例 |
|------|------|------|
| `set` | 顯示所有 shell 變數 | `set \| grep PATH` |
| `env` | 顯示環境變數 | `env` |
| `export` | 匯出變數給子程序 | `export MYVAR=123` |
| `printenv` | 顯示指定環境變數 | `printenv HOME` |
| `echo $VAR` | 顯示變數值 | `echo $PATH` |
| `PATH=...` | 修改指令搜尋路徑 | `PATH="$HOME/bin:$PATH"` |

**Script 範例：test_env.sh**
```bash
#!/bin/bash
echo "Inside script:"
echo "MYVAR = $MYVAR"
```
```bash
MYVAR=123 ./test_env.sh        # 不會顯示（非 export）
export MYVAR=123; ./test_env.sh # 會顯示 123
```

---

## 五、壓縮與封裝
**tar 參數說明：`c`=建立、`x`=解壓、`v`=顯示過程、`f`=指定檔名、`z`=gzip、`j`=bzip2、`J`=xz**

| 指令 | 功能 | 範例 |
|------|------|------|
| `tar -cvf 檔名.tar 目錄` | 封裝成 tar（不壓縮） | `tar -cvf backup.tar project/` |
| `tar -xvf 檔名.tar` | 解開 tar 封裝檔 | `tar -xvf backup.tar` |
| `tar -czvf 檔名.tar.gz 目錄` | 封裝 + gzip 壓縮（最常用） | `tar -czvf project.tar.gz project/` |
| `tar -xzvf 檔名.tar.gz` | 解壓縮 .tar.gz 檔案 | `tar -xzvf project.tar.gz` |
| `tar -cjvf 檔名.tar.bz2 目錄` | 封裝 + bzip2 壓縮（壓縮比更高） | `tar -cjvf project.tar.bz2 project/` |
| `tar -xjvf 檔名.tar.bz2` | 解壓縮 .tar.bz2 檔案 | `tar -xjvf project.tar.bz2` |
| `tar -cJvf 檔名.tar.xz 目錄` | 封裝 + xz 壓縮（壓縮比最高） | `tar -cJvf project.tar.xz project/` |
| `tar -xJvf 檔名.tar.xz` | 解壓縮 .tar.xz 檔案 | `tar -xJvf project.tar.xz` |
| `tar -tf 檔名.tar` | 列出封裝檔內容（不解壓） | `tar -tf backup.tar` |
| `gzip 檔名` | 壓縮單一檔案（會刪除原檔） | `gzip largefile.txt` → `largefile.txt.gz` |
| `gunzip 檔名.gz` | 解壓縮 .gz 檔案 | `gunzip file.gz` |

---

## 六、檔案列表與磁碟空間分析
| 指令 | 功能 | 範例 |
|------|------|------|
| `ls` | 列出檔案 | `ls` |
| `ls -l` | 詳細列表（權限、擁有者、大小、時間） | `ls -l /etc` |
| `ls -lh` | 詳細列表 + 人性化大小顯示（KB、MB、GB） | `ls -lh /var/log` |
| `ls -la` | 顯示所有檔案（包含隱藏檔 .開頭） | `ls -la ~` |
| `ls -lS` | 依檔案大小排序（大到小） | `ls -lhS /var/log` |
| `ls -lt` | 依修改時間排序（新到舊） | `ls -lt ~` |
| `ls -ltr` | 依修改時間反向排序（舊到新） | `ls -ltr /tmp` |
| `du -sh 目錄` | 顯示目錄總大小（單一數值） | `du -sh /home` |
| `du -h 目錄` | 顯示目錄內所有檔案大小 | `du -h /var/log` |
| `du -h --max-depth=1 目錄` | 只顯示第一層子目錄大小 | `du -h --max-depth=1 /home` |
| `df -h` | 顯示磁碟空間使用狀況 | `df -h` |
| `tree` | 樹狀顯示目錄結構（需安裝） | `tree /etc -L 2` |

---

## 七、管線與重導向
| 符號/指令 | 功能 | 範例 |
|------|------|------|
| `指令1 \| 指令2` | 管線：將前面指令的輸出傳給後面指令 | `cat /etc/passwd \| grep bash` |
| `指令 > 檔案` | 輸出重導向（覆蓋檔案） | `echo "test" > file.txt` |
| `指令 >> 檔案` | 附加輸出（不覆蓋，加在檔案最後） | `echo "new log" >> log.txt` |
| `指令 2> 檔案` | 只重導向錯誤訊息 | `ls /nonexist 2> error.log` |
| `指令 2>&1` | 將錯誤訊息合併到標準輸出 | `ls /etc > out.txt 2>&1` |
| `指令 &> 檔案` | 同時重導向輸出和錯誤（簡寫） | `ls /etc &> all.log` |
| `wc -l 檔案` | 計算行數 | `wc -l /etc/passwd` |
| `sort 檔案` | 排序內容（字母順序） | `sort names.txt` |
| `sort -n` | 數字排序 | `sort -n numbers.txt` |
| `uniq` | 去除連續重複行（需先排序） | `sort data.txt \| uniq` |
| `uniq -c` | 計算每行出現次數 | `sort data.txt \| uniq -c` |
| `cut -d分隔符 -f欄位` | 欄位切割 | `cut -d: -f1,3 /etc/passwd` |
| `awk '{print $欄位}'` | 進階欄位處理 | `awk '{print $1}' file.txt` |

---

## 八、帳號與群組管理
| 指令 | 功能 | 範例 |
|------|------|------|
| `useradd 使用者` | 新增使用者 | `useradd john` |
| `useradd -m 使用者` | 新增使用者並建立家目錄 | `useradd -m john` |
| `useradd -G 群組 使用者` | 新增使用者並加入群組 | `useradd -G developers john` |
| `usermod -G 群組 使用者` | 設定使用者的附加群組（會覆蓋原本的） | `usermod -G admin john` |
| `usermod -aG 群組 使用者` | **追加**群組（不覆蓋原有群組）⭐ | `usermod -aG docker john` |
| `usermod -l 新名 舊名` | 修改使用者名稱 | `usermod -l john_new john` |
| `userdel 使用者` | 刪除使用者（保留家目錄） | `userdel john` |
| `userdel -r 使用者` | 刪除使用者及其家目錄 | `userdel -r john` |
| `groupadd 群組` | 新增群組 | `groupadd developers` |
| `groupdel 群組` | 刪除群組 | `groupdel developers` |
| `gpasswd -a 使用者 群組` | 將使用者加入群組 | `gpasswd -a john sudo` |
| `gpasswd -d 使用者 群組` | 將使用者從群組移除 | `gpasswd -d john sudo` |
| `passwd 使用者` | 設定或修改密碼（交談式） | `passwd john` |
| `echo "密碼" \| passwd --stdin 使用者` | 非交談方式設定密碼（適合腳本）⭐ | `echo "P@ssw0rd" \| passwd --stdin john` |
| `chpasswd` | 批次修改多個使用者密碼 | `echo "john:P@ssw0rd" \| chpasswd` |
| `chage -M 天數 使用者` | 設定密碼最長有效天數 | `chage -M 90 john` |
| `chage -d 0 使用者` | 強制下次登入時修改密碼 | `chage -d 0 john` |
| `id 使用者` | 顯示 UID、GID 和所屬群組 | `id john` |
| `whoami` | 顯示目前使用者名稱 | `whoami` |
| `who` | 顯示目前登入的使用者 | `who` |
| `sudo 指令` | 以 root 權限執行指令 | `sudo apt update` |
| `su - 使用者` | 切換使用者（載入環境變數） | `su - root` |
| `su 使用者` | 切換使用者（不載入環境變數） | `su root` |
| `visudo` | 安全編輯 /etc/sudoers 檔案 | `visudo` |

**⚠️ 重要提醒：`usermod -G` vs `usermod -aG`**  
- `-G 群組`：**完全取代**使用者的所有附加群組（危險！）  
- `-aG 群組`：**追加**新群組到使用者（保留原有群組）✅ **建議使用**

---

## 九、sudoers 範例（visudo）
```bash
john ALL=(root) NOPASSWD: /usr/bin/useradd, /usr/bin/passwd
```
→ 允許 john 無密碼執行 `useradd` 和 `passwd`

---

## 九之一、非交談式密碼設定（批次作業專用）

### 方法一：使用 `passwd --stdin`（推薦用於 CentOS/Rocky）
```bash
# 單一使用者
echo "新密碼" | passwd --stdin 使用者名稱

# 範例：建立使用者並設定密碼
useradd -m john
echo "P@ssw0rd123" | passwd --stdin john
```

### 方法二：使用 `chpasswd`（批次修改多個使用者）
```bash
# 單一使用者
echo "使用者名稱:密碼" | chpasswd

# 範例
echo "john:P@ssw0rd123" | chpasswd

# 批次修改（從檔案讀取）
# 先建立 passwords.txt 內容如下：
# john:Password1
# mary:Password2
# tom:Password3
chpasswd < passwords.txt
```

### 方法三：使用 `echo` 配合 `chpasswd`（適合腳本）
```bash
# 批次建立使用者的完整範例
for user in user1 user2 user3; do
    useradd -m $user
    echo "$user:Default@123" | chpasswd
    chage -d 0 $user  # 強制首次登入修改密碼
done
```

**⚠️ 安全注意事項：**
- 密碼會出現在指令歷史紀錄中，使用後建議執行 `history -c` 清除
- 腳本檔案應設定權限 `chmod 700`，避免他人讀取
- 密碼檔案使用完畢後應立即刪除：`shred -u passwords.txt`

---

## 十、特殊實用指令與快捷鍵
| 指令 | 功能 | 範例 |
|------|------|------|
| `cd` 或 `cd ~` | 回到自己的家目錄 | `cd` |
| `cd -` | 切換到上一個工作目錄 | `cd -` |
| `cd ~使用者` | 進入其他使用者的家目錄 | `cd ~john` |
| `cd ..` | 回到上層目錄 | `cd ..` |
| `cd ../..` | 回到上兩層目錄 | `cd ../..` |
| `pwd` | 顯示目前所在目錄的完整路徑 | `pwd` |
| `alias 名稱='指令'` | 設定指令別名（本次登入有效） | `alias ll='ls -lh'` |
| `unalias 名稱` | 移除別名 | `unalias ll` |
| `history` | 顯示指令歷史紀錄 | `history` |
| `!數字` | 執行歷史紀錄中的第 N 個指令 | `!123` |
| `!!` | 重複執行上一個指令 | `!!` |
| `man 指令` | 查看指令的說明文件 | `man ls` |
| `man 數字 指令` | 查看特定章節的說明 | `man 5 passwd` |
| `指令 --help` | 查看指令的簡易說明 | `ls --help` |
| `clear` 或 `Ctrl+L` | 清除終端機畫面 | `clear` |

**常用鍵盤快捷鍵：**
- `Tab`：自動補全檔名或指令
- `Ctrl+C`：中斷目前執行的指令
- `Ctrl+D`：登出或結束輸入
- `Ctrl+R`：搜尋歷史指令
- `Ctrl+A`：游標移到行首
- `Ctrl+E`：游標移到行尾
- `Ctrl+U`：刪除游標前所有字元

**永久設定別名：**
```bash
echo "alias ll='ls -lh'" >> ~/.bashrc
echo "alias la='ls -lha'" >> ~/.bashrc
source ~/.bashrc  # 立即生效
```

---

## 十一、相關設定檔
| 檔案 | 用途 |
|------|------|
| `/etc/passwd` | 使用者帳號資訊 |
| `/etc/shadow` | 密碼與過期資訊 |
| `/etc/group` | 群組資訊 |
| `/etc/sudoers` | sudo 權限設定 |
| `/etc/skel/` | 新使用者家目錄範本 |
| `/etc/login.defs` | 帳號預設值 |
| `/etc/security/pwquality.conf` | 密碼強度規則 |

---

## 十二、實用案例快速設定
| 需求 | 設定方式 |
|------|--------|
| 新使用者自動有基本檔案 | 將檔案放入 `/etc/skel/` 目錄<br>（如 `.bashrc`、`README.txt`） |
| 設定密碼最長有效期 90 天 | 編輯 `/etc/login.defs`：<br>`PASS_MAX_DAYS 90` |
| 設定密碼最短長度 10 字元 | 編輯 `/etc/security/pwquality.conf`：<br>`minlen = 10` |
| 強制使用者首次登入時修改密碼 | `chage -d 0 使用者名稱` |
| 檢視使用者密碼狀態 | `chage -l 使用者名稱` |
| 非交談式批次建立使用者並設密碼 | `useradd -m john && echo "P@ssw0rd" \| passwd --stdin john` |
| 批次修改多個使用者密碼 | 建立檔案含 `使用者:密碼` 每行一組<br>`chpasswd < passwords.txt` |
| 搜尋所有使用 bash 的使用者 | `grep "/bash$" /etc/passwd` |
| 查看系統所有群組 | `cat /etc/group` |

---

## 十三、權限管理（補充）
| 指令 | 功能 | 範例 |
|------|------|------|
| `chmod 權限 檔案` | 修改檔案權限 | `chmod 755 script.sh` |
| `chmod u+x 檔案` | 給擁有者執行權限 | `chmod u+x script.sh` |
| `chmod go-w 檔案` | 移除群組和其他人的寫入權限 | `chmod go-w file.txt` |
| `chown 使用者:群組 檔案` | 修改檔案擁有者和群組 | `chown john:developers app.py` |
| `chown -R 使用者 目錄` | 遞迴修改整個目錄的擁有者 | `chown -R john /home/john` |
| `chgrp 群組 檔案` | 只修改檔案的群組 | `chgrp developers project/` |

**權限數字對照：**
- `r`(讀) = 4, `w`(寫) = 2, `x`(執行) = 1
- `755` = `rwxr-xr-x`（擁有者全部權限，其他人讀取+執行）
- `644` = `rw-r--r--`（擁有者讀寫，其他人只讀）
- `600` = `rw-------`（只有擁有者能讀寫）
