# Nvim-Preview-CSV

Preview csv file

## Usage

```
:lua require('nvim-preview-csv').preview()
```

## Setup

```lua
local preview = require('nvim-previem-csv')

preview.setup {
		max_csv_line = 100 -- CSV file may has thousands of lines which easily break neovim so choose carefully
}
```

## Screenshot

![CSV](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-preview-csv/large_csv.png)

![Preview](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-preview-csv/preview_large_csv.png)

## TODO

- [ ] Show more line with large CSV file
- [ ] Striped table
- [ ] Add highlight group

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
