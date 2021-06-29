# Nvim-Preview

Preview some filetypes such as csv, markdown (not implement yet)

## Usage

```
:lua require('nvim-preview').preview()
```

## Setup

```lua
local preview = require('nvim-previem')

preview.setup {
		max_csv_line = 100 -- CSV file may has thousands of lines which easily break neovim so choose carefully
}
```

## Screenshot

![CSV](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-preview/large_csv.png)

![Preview](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-preview/preview_large_csv.png)

## TODO

- [ ] Support markdown
- [ ] Show more line with large CSV file
- [ ] Striped table
- [ ] Add highlight group
- [ ] Support OpenAPI
- [ ] Support Groff

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
