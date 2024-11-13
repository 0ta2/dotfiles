return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            {
                "zbirenbaum/copilot.lua",
                cmd = "Copilot",
                event = "InsertEnter",
                config = true,
            },
        },
        build = "make tiktoken",
        opts = {
            debug = true,
            prompts = {
                Explain = {
                    prompt = "/COPILOT_EXPLAIN コードを日本語で説明してください",
                    description = "コードの説明をお願いする",
                },
                Review = {
                    prompt = '/COPILOT_REVIEW コードを日本語でレビューしてください。',
                    description = "コードのレビューをお願いする",
                },
                Fix = {
                    prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします。",
                    description = "コードの修正をお願いする",
                },
                Optimize = {
                    prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
                    description = "コードの最適化をお願いする",
                },
                Docs = {
                    prompt = "/COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください。",
                    description = "コードのドキュメント作成をお願いする",
                },
                Tests = {
                    prompt = "/COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします。",
                    description = "テストコード作成をお願いする",
                },
                FixDiagnostic = {
                    prompt = 'コードの診断結果に従って問題を修正してください。修正内容の説明は日本語でお願いします。',
                    description = "コードの修正をお願いする",
                },
                Commit = {
                    prompt =
                    '実装差分に対するコミットメッセージを日本語で記述してください。',
                    description = "コミットメッセージの作成をお願いする",
                },
                CommitStaged = {
                    prompt =
                    'ステージ済みの変更に対するコミットメッセージを日本語で記述してください。',
                    description = "ステージ済みのコミットメッセージの作成をお願いする",
                },
            },
        },
    },
}
