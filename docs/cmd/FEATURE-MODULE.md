# Module


#
## Search - Google
Use
```bash
python tests/req/mdle-searchgg.py -a </amount>
```
| Parameter        | Data Type   | Default  | Description                                                                      |
| ---------------- | ----------- | -------- | -------------------------------------------------------------------------------- |
| `-a`, `--amount` | `int`       | `10`     | Number of URLs to retrieve from Google search results. The range should be 1–50. |

#
## Plot - Country on a Map
Use
```bash
python tests/req/mdle-ggearth.py -t </title> -c </color> -w </width> -ht </height>
```
| Argument         | Short  | Type     | Default          | Description                              |
|----------------- |------- |--------  |----------------- |----------------------------------------- |
| `--title`        | `-t`   | `string` | `"Country Map"`  | Title of the plot                        |
| `--color`        | `-c`   | `string` | `"value"`        | Column name for color scale              |
| `--width`        | `-w`   | `int`    | `800`            | Width of the plot (in pixels)            |
| `--height`       | `-ht`  | `int`    | `600`            | Height of the plot (in pixels)           |
