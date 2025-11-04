local home = os.getenv("HOME")
local jdtls = require("jdtls")
local utils = require("utils")

local hostname = utils.get_hostname()

local root_markers
local root_dir
local Java_debug_plugin
local Java_path
local Jdtls_config

if hostname == "7cf34dd2a0d5" then -- settings for local Amazon machine
    root_markers = { "packageInfo" }
    root_dir = require("jdtls.setup").find_root(root_markers, "Config")

    Java_debug_plugin =
    "/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.53.1/com.microsoft.java.debug.plugin-0.53.1.jar"
    Java_version = "JavaSE-21"
    Java_path = "/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home"
    Jdtls_config = "config_mac_arm"
elseif hostname == "dev-dsk-nickmarx-2c-b25eba4a.us-west-2.amazon.com" then -- settings for cloud desktop
    root_markers = { "packageInfo" }
    root_dir = require("jdtls.setup").find_root(root_markers, "Config")

    Java_debug_plugin =
    "/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.53.1/com.microsoft.java.debug.plugin-0.53.1.jar"
    Java_version = "JavaSE-21"
    Java_path = "/usr/lib/jvm/java-21-amazon-corretto"
    Jdtls_config = "config_linux"
else -- settings for personal PC
    root_markers = { "gradlew", "mvnw", ".git", "mvnw", "pom.xml", "build.gradle" }
    root_dir = require("jdtls.setup").find_root(root_markers)

    Java_debug_plugin = "/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.50.0/*.jar"
    Java_version = "JavaSE-19"
    Java_path = home .. "/.asdf/installs/java/temurin-19.0.2+7"
    Jdtls_config = "config_linux"
end

local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local bundles = {
    vim.fn.glob(home .. Java_debug_plugin),
}

-- add Brazil workspace folders
local ws_folders_jdtls = {}
if root_dir and hostname == "7cf34dd2a0d5" then
    local file = io.open(root_dir .. "/.bemol/ws_root_folders")
    if file then
        for line in file:lines() do
            table.insert(ws_folders_jdtls, "file://" .. line)
        end
        file:close()
    end
end

vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.m2/vscode-java-test/server/*.jar", true), "\n"))

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- The on_attach function is used to set key maps after the language server
-- attaches to the current buffer
local on_attach = function(_, _)
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true

    ---- Java extensions provided by jdtls
    vim.keymap.set("n", "<A-o>", jdtls.organize_imports, { desc = "Organize imports" })
    vim.keymap.set("n", "<leader>jev", jdtls.extract_variable, { desc = "Extract variable" })
    vim.keymap.set("n", "<leader>jec", jdtls.extract_constant, { desc = "Extract constant" })
    vim.keymap.set("n", "<leader>jem", jdtls.extract_method, { desc = "Extract method" })

    -- For DAP config
    vim.keymap.set("n", "<leader>dtl", require("jdtls").test_class, { desc = "Debug Test Class" })
    vim.keymap.set("n", "<leader>dtn", require("jdtls").test_nearest_method, { desc = "Debug Nearest Test" })
    vim.keymap.set("n", "<leader>dtp", function()
        require("jdtls").setup_dap({ hotcodereplace = "auto" })
        require("jdtls.dap").pick_test()
    end, { desc = "Pick Java Test to Debug" })
    jdtls.setup_dap({ hotcodereplace = "auto" })
end

local config = {
    flags = {
        debounce_text_changes = 80,
    },
    on_attach = on_attach, -- We pass our on_attach keybindings to the configuration map
    capabilities = capabilities,
    init_options = {
        bundles = bundles,
        workspaceFolders = ws_folders_jdtls,
    },
    root_dir = root_dir, -- Set the root directory to our found root_marker
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code
            -- Specify any completion options
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
                },
            },
            -- How code generation should act
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                hashCodeEquals = {
                    useJava7Objects = true,
                },
                useBlocks = true,
            },
            configuration = {
                runtimes = {
                    {
                        name = Java_version,
                        path = Java_path,
                    },
                },
            },
            saveActions = {
                organizeImports = false
            }
        },
    },
    cmd = {
        Java_path .. "/bin/java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx4g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-javaagent:" .. home .. "/.local/share/eclipse/lombok.jar",
        "-jar",
        vim.fn.glob(
            "/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_*.jar"
        ),
        "-configuration",
        "/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/" .. Jdtls_config,

        "-data",
        workspace_folder,
    },
}

jdtls.start_or_attach(config)
