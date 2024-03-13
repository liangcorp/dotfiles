return {
    'prettier/vim-prettier',

    -- build = {
    --     "npm install yarn -g; yarn install --frozen-lockfile --production 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'"
    -- },

    keys = {
        { '<space>p', ":Prettier<CR>", desc = "[P]rettier" },
    },
}
