# One Dark Perso

- `One Dark Pro.ghostty`: original Ghostty/Rex terminal palette.
- `one-dark-pro.desktop.json`: OpenCode Desktop theme definition based on that palette.

Source: https://github.com/Binaryify/OneDark-Pro

The desktop definition uses the terminal background and foreground as its neutral
and ink colors, cursor blue as its primary color, and the ANSI green, orange, red,
cyan, and purple for feedback and keywords. Both appearance variants use the same
palette to retain the supplied dark colors. OpenCode generates other UI colors
from the palette; this is not a pixel-for-pixel terminal rendering.

## OpenCode Desktop

The local GUI plugin in this directory registers the JSON file:

```ts
import { Plugin, Theme } from "@opencode/plugin/gui"
import oneDarkPro from "./one-dark-pro.desktop.json"

export default Plugin.define({
  setup(ctx) {
    ctx.add(Theme, oneDarkPro)
  },
})
```

To rebuild after editing the palette:

```sh
cd ~/ws/dev/terminal-config/theme
npm ci
npm run build
```

The repository and global `opencode.jsonc` files register this directory by its
absolute path. Update that path if you move the repository. Build the plugin
before deploying the configuration on another machine.

Experimental GUI plugin documentation:
https://opencode.ai/v2/docs/build/plugins/gui/#themes

Then select **Settings → Appearance → Theme → One Dark Perso**.
The desktop definition is not a terminal theme and does not belong in `cli.json`.
