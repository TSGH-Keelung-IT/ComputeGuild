# ComputeGuild

Windows 專用的 Codex 桌面使用量面板，以像素冒險者公會呈現每週／5 小時行動力、帳號剩餘 Credits、今日 Token 與進行中的任務。

面板會直接讀取本機 Codex 資料，不需要另外安裝或啟動 Codex 使用儀表板。

![ComputeGuild 預覽](preview.jpg)

## 系統需求

- Windows 10 或 Windows 11（x64）
- 已安裝並登入 Codex Desktop
- 可使用 `codex` 命令列

## 安裝

在 PowerShell 依序執行：

```powershell
codex plugin marketplace add TSGH-Keelung-IT/ComputeGuild
codex plugin add codex-usage-companion@compute-guild
```

接著在 Codex：

1. 開啟「外掛程式」→「掛勾」。
2. 找到 ComputeGuild，檢閱並信任 3 個掛勾。
3. 開啟 3 個掛勾的切換鈕。
4. 建立新的 task 並送出一則訊息，面板即會啟動。

若第一次未顯示，請完全關閉並重新開啟 Codex Desktop，再建立新的 task。

## 使用方式

- 「每週行動力」可切換每週與 5 小時使用狀態。
- 「公會總資產」顯示帳號剩餘 Credits。
- 「今日採集」顯示本機今日 Token，並估算 Credits。
- 「選項」可切換顯示風格與選擇 1～3 名角色。
- 場景會依本機時間切換日夜；角色狀態會隨剩餘行動力變化。

## 選用：自動恢復面板

若希望面板在意外關閉後自動恢復，請以一般使用者身分執行：

```powershell
& "$env:USERPROFILE\.codex\plugins\cache\compute-guild\codex-usage-companion\0.5.18\scripts\install-recovery.ps1"
```

不同 Codex 版本的快取路徑可能不同；也可以在已安裝外掛目錄內直接執行 `scripts\install-recovery.ps1`。

移除恢復排程：

```powershell
& "<已安裝外掛目錄>\scripts\uninstall-recovery.ps1"
```

## 移除

```powershell
codex plugin remove codex-usage-companion
codex plugin marketplace remove compute-guild
```

## 隱私

ComputeGuild 僅在本機讀取 Codex 使用量與任務狀態，不含遙測、廣告或外部分析服務。詳見 [PRIVACY.md](PRIVACY.md)。

## 授權與致謝

本專案以 MIT License 發布，保留原作者 gkfriend 的授權聲明。完整條款見 [LICENSE](LICENSE)。
