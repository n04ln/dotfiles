local if_nil = vim.F.if_nil

local default_header = {
	type = "text",
	val = {
		-- [[　　　　　　　　　　┌─────────── ]],
		-- [[　　　　　　　　　　│モーニングやってます♪ ]],
		-- [[　　　　　　　　　　└──────────── ]],
		-- [[　 　 ∧＿∧   やあ ]],
		-- [[　　（´・ω・｀)　　　　  　    /　　　　　　　ようこそ、バーボンハウスへ。 ]],
		-- [[　　／∇y:::::＼　　  [￣￣]　　　　          このテキーラはサービスだから、まず飲んで落ち着いて欲しい。 ]],
		-- [[　　|:⊃:|:::::|　 　　|──| ]],
		-- [[￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣|　     うん、「また」なんだ。済まない。 ]],
		-- [[￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣|￣￣　     仏の顔もって言うしね、謝って許してもらおうとも思っていない。 ]],
		-- [[￣￣￣￣￣￣￣￣￣￣￣￣￣￣／| ]],
		-- [[　　　　∇　∇　∇　∇　　　　／.／|　　　    でも、このコードを見たとき、君は、きっと言葉では言い表せない ]],
		-- [[　　　　┴　┴　┴　┴　　　 ／／ .|　　   　「ときめき」みたいなものを感じてくれたと思う。 ]],
		-- [[￣￣￣￣￣￣￣￣￣￣￣￣|／　  |　　    　殺伐とした世の中で、そういう気持ちを忘れないで欲しい ]],
		-- [[￣￣￣￣￣￣￣￣￣￣￣￣　　　 |　　　    そう思って、このNeoVimを立ち上げたんだ。 ]],
		-- [[　　　(⊆⊇)　(⊆⊇)　(⊆⊇)　　　　 | ]],
		-- [[　　　 ||　　||　 .||　　　　　|　　　    じゃあ、注文を聞こうか。 ]],
		--
		[[                     ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿ ]],
		[[      ・・・・・　　|　　　　　 　              　　　　 　|]],
		[[                    |　ぬるぽはぬるぽだからぬるぽなんだよ  |]],
		[[           ∧＿∧　　∠                                       |]],
		[[          ( ´･ω･)ｺ  ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣]],
		[[          (　ｏロ.ノ   ヱ                                   ]],
		[[          ｀ｕ―ｕ'~~~〔◎〕                                  ]],
		[[          """""""""""""                                     ]],
		--
	},
	opts = {
		position = "center",
		hl = "Type",
		-- wrap = "overflow";
	},
}

local footer = {
	type = "text",
	val = "",
	opts = {
		position = "center",
		hl = "Number",
	},
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 5,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}
	if keybind then
		keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		-- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
		local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

local buttons = {
	type = "group",
	val = {
		button("e", "  New file", "<cmd>ene <CR>"),
		-- button("SPC f f", "  Find file"),
		-- button("SPC f h", "  Recently opened files"),
		-- button("SPC f r", "  Frecency/MRU"),
		-- button("SPC f g", "  Find word"),
		-- button("SPC f m", "  Jump to bookmarks"),
		-- button("SPC s l", "  Open last session"),
		button("Ctrl f", "  Find file", "<Cmd>Telescope find_files<CR>"),
		button("Ctrl a", "  Recently opened files", "<Cmd>Telescope oldfiles<CR>"),
		-- button("SPC f r", "  Frecency/MRU"),
		button("SPC s f", "  Find word", ":CtrlSF "),
		-- button("SPC f m", "  Jump to bookmarks"),
		-- button("SPC s l", "  Open last session"),
	},
	opts = {
		spacing = 1,
	},
}

local section = {
	header = default_header,
	buttons = buttons,
	footer = footer,
}

local config = {
	layout = {
		{ type = "padding", val = 1 },
		section.header,
		{ type = "padding", val = 1 },
		section.buttons,
		section.footer,
	},
	opts = {
		margin = 5,
	},
}

local setting = {
	button = button,
	section = section,
	config = config,
	-- theme config
	leader = leader,
	-- deprecated
	opts = config,
}

require 'alpha'.setup(setting.config)
