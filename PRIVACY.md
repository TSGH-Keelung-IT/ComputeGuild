# 隱私說明

ComputeGuild 在 Windows 本機執行，不包含遙測、廣告、外部分析服務，也不會上傳設定或紀錄。

為顯示面板資訊，程式會在本機：

- 從 Codex app-server 讀取速率限制與帳號使用量摘要。
- 從本機 Codex rollout 的 `token_count` 事件加總今日 Token。
- 從本機 Codex 狀態資料與任務生命週期標記判斷進行中的任務。
- 必要時以第一則使用者訊息作為任務名稱備援；不會複製或保存完整對話內容。

程式不讀取、複製或保存登入權杖。

本機檔案：

- 設定儲存在 Codex 外掛資料目錄；若不可用，則位於 `%LOCALAPPDATA%\CodexUsageCompanion\settings.json`。
- 有容量上限的診斷紀錄位於 `%LOCALAPPDATA%\CodexUsageCompanion`。
- 選用的自動恢復功能會建立目前使用者的 Windows 排程工作，並可由隨附的移除腳本刪除。
