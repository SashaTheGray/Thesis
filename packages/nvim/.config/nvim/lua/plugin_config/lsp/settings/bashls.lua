local config = {
    languageserver = {
        bash = {
            command = "bash-language-server",
            args = {"start"},
            filetypes = {"bash", "sh"},
            ignoredRootPaths = {"~"}
        }
    },
}

config["diagnostic-languageserver.filetypes"] = {sh = "shellcheck"}

return config
