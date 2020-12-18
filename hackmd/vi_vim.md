[![hackmd-github-sync-badge](https://hackmd.io/P-auBUT0T2q7DM4KHl1IvA/badge)](https://hackmd.io/P-auBUT0T2q7DM4KHl1IvA)
{%hackmd j1-jtNWMSlW8Hpfz6P2p4g %}
# vi/vim
關於 vim 的操作

一般使用者(像是我), 一開始真的捉摸不到 vim 的互動方式, 在此紀錄一些歷程.  
結果認真一挖, 這坑不得了...

---

## 模式
需要確認目前的模式, 對應的操作才會正確:
- `Normal`: 主要的檢視模式
- `Insert`: 基本上就是一般文件的編輯模式
- `Visual`: 主要用於和滑鼠互動的模式
- `Command`: 真正所謂的 `指令`
- `Replace`: 基本上和 insert 模式差不多, 只是會直接複寫目前的內容.

---

## 操作 - 簡易版
如果你只是要看看檔案, 小修內容, 看這版本足以應付.  

操作方式當初根本找不到要 `在哪` 輸入XDD  
認清模式後, `直接` 敲鍵盤輸入即可, 有些指令畫面上的回饋都沒有...  

### Normal

|operation|title|
|-|-|
|`:`|進入command模式|
|`i`|進入insert模式, 游標留在原地|
|`v`|進入visual模式, 以`字元`選取|
|`u`|復原動作(undo), 不小心按到甚麼, 先`u`就對了!!|
|`ctrl`+`r`|重做動作(redo)|
|`arrow left`|游標向左移動一個字元|
|`arrow right`|游標向右移動一個字元|
|`arrow down`|游標向下一行|
|`arrow up`|游標向上一行|
|`p`|在游標之`後`貼上複製的內容|
|`/`|**向下**搜尋字串(手動輸入)|
|`?`|**向上**搜尋字串(手動輸入)|
|`*`|**向下**搜尋**完全**符合目前游標所在的`詞`|
|`#`|**向上**搜尋**完全**符合目前游標所在的`詞`|
|`g*`|**向下**搜尋**部分**符合目前游標所在的`詞`|
|`g#`|**向上**搜尋**部分**符合目前游標所在的`詞`|
|`n`|**正向**繼續搜尋|
|`N`|**反向**繼續搜尋|
|`m`|標記目前位置, 目標可使用英文字母. eg. `mh` 將目前位置記錄在 `h`|
|\`|`backward quote`, 移動至標記的位置. eg. ``` `h ``` 移動至`h`紀錄的位置|
|`'`| `forward quote`, 移動至標記所在的`行`首. eg. `'h` 移動至`h`紀錄所在的行首|
|`d` `d`|刪除游標所在`行`|


#### mark
- 小寫字母僅限檔案內. eg. `ma`
- 大寫字母可跨檔案. eg. `mB`
- 數字表示前N次編輯的檔案, 通常用來切換於 eg. `'3'`
- 可用 `:marks` 查詢所有標記


### Insert

|operation|title|
|-|-|
|`ESC` or `ctrl`+`[`|返回normal模式|

### Visual

|operation|title|
|-|-|
|`ESC` or `ctrl`+`[`|返回normal模式|
|`d`|刪除所選取的內容|
|`y`|複製所選取的內容|

### Command

|operation|title|
|-|-|
|`ESC` or `ctrl`+`[`|返回normal模式|
|`:h`|幫助文件|
|`:q`|離開|
|`:w`|存檔|
|`:wq`|存檔然後離開|
|`:q!`|無視任何修改離開 vim|
|`:456`|移動至第`456`行|
|`:set number`|顯示行號, 也可 `:set nu` 替代|
|`:set nonumber`|隱藏行號, 也可用 `:set nonu` 替代|

### Replace
|operation|title|
|-|-|
|`ESC` or `ctrl`+`[`|返回normal模式|

---

## 操作 - 進階
說真的紀錄不完, 就當作辭典查詢吧

### Noraml
|operation|title|
|-|-|
|`:`|進入command模式|
|`i`|進入insert模式, 游標留在原地|
|`a`|進入insert模式, 游標移至下一個字元|
|`o`|進入insert模式, 插入新的一行於所在行之後, 並將游標移至新行的開頭|
|`shift`+`i`|進入insert模式, 游標移至所在行的開頭|
|`shift`+`a`|進入insert模式, 游標移至所在行的結尾|
|`shift`+`o`|進入insert模式, 插入新的一行於所在行之前, 並將游標移至新行的開頭|
|`v`|進入visual模式, 以`字元`選取|
|`shift`+`v`|進入visual line模式, 以`行`選取|
|`ctrl`+`v`|進入visual block模式, 以`區塊`選取|
|`shift`+`r`|進入replace模式|
|`u`|復原動作(undo)|
|`ctrl`+`r`|重做動作(redo)|
|`h` or `arrow left`|游標向左移動一個字元|
|`l` or `arrow right`|游標向右移動一個字元|
|`j` or `arrow down`|游標向下一行|
|`k` or `arrow up`|游標向上一行|
|`w`|移動至下一個詞的開頭|
|`b`|移動至上一個詞的開頭|
|`e`|移動至詞的結尾|
|`shift`+`w`|移動至下一個位於空白字元後的詞的開頭|
|`shift`+`b`|移動至上一個位於空白字元後的詞的開頭|
|`shift`+`e`|移動至下一個位於空白字元前的詞的結尾|
|`0`|移動至此行開頭|
|`$`|移動至此行結尾|
|`~`|切換大小寫|
|`.`|重複上一個動作|
|`<` `<`|減少縮排|
|`>` `>`|增加縮排|
|`y` or `shift`+`y`|複製游標所在的`行`的內容|
|`p`|在游標之`後`貼上複製的內容|
|`shift`+`p`|在游標之`前`貼上複製的內容|
|`"` `a`|指定選衝區, 26個英文字母都可使用, 大寫表示append上去|
|`/`|**向下**搜尋字串(手動輸入)|
|`?`|**向上**搜尋字串(手動輸入)|
|`*`|**向下**搜尋**完全**符合目前游標所在的`詞`|
|`#`|**向上**搜尋**完全**符合目前游標所在的`詞`|
|`g*`|**向下**搜尋**部分**符合目前游標所在的`詞`|
|`g#`|**向上**搜尋**部分**符合目前游標所在的`詞`|
|`n`|**正向**繼續搜尋|
|`N`|**反向**繼續搜尋|
|`m`|標記目前位置, 目標可使用英文字母. eg. `mh` 將目前位置記錄在 `h`|
|\`|`backward quote`, 移動至標記的位置. eg. ``` `h ``` 移動至`h`紀錄的位置|
|`'`| `forward quote`, 移動至標記所在的`行`首. eg. `'h` 移動至`h`紀錄所在的行首|

### Insert
### Visual
|operation|title|
|-|-|
|`shift`+`r`|進入replace模式, 直接移除目前`行`內的文字|

### Command
|operation|title|
|-|-|
|`:h`|幫助文件|
|`:q`|離開|
|`:w`|存檔|
|`:wq`|存檔然後離開|
|`:q!`|無視任何修改離開 vim|
|`:456`|移動至第`456`行|
|`:m+3`|將所在`行`向下移動`3`行.|
|`:m-2`|將所在`行`向上移動`1`行. 沒錯, `m-1`會留在原地.|
|`:marks`|列出所有標記的資料|
|`:set number`|顯示行號, 也可 `:set nu` 替代|
|`:set nonumber`|隱藏行號, 也可用 `:set nonu` 替代|

### Replace


### 數字組合技
大多的操作都可以搭配數字使用, 例如:  
`4j` 就會一次下移4行  
`6h` 就會一次左移6個字元  

---
## clipboard

### 檢測有無此功能
```
vim --version
```
`+clipboard` 表示支援  
`-clipboard` 表示沒有  

### No `+clipboard`?
> Debian & Ubuntu: Install `vim-gtk3`.  
> Fedora: install `vim-X11`, and run `vimx` instead of `vim` ([more info](https://vi.stackexchange.com/q/2063/51)).  
> Arch Linux: install `gvim` (this will enable `+clipboard` for normal vim as well).

#### CentOS 7
```
yum -y install vim-X11
```
接著用 `vimx` 取代 `vim` 即可.

---

## 參考
- [Vim Editor Modes Explained](https://www.freecodecamp.org/news/vim-editor-modes-explained/)
- [大家來學VIM（一個歷久彌新的編輯器）](http://www.study-area.org/tips/vim/index.html)
- [How can I copy text to the system clipboard from Vim?]()

###### tags: `vim` `vi`