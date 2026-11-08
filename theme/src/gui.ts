import { Plugin, Theme } from "@opencode/plugin/gui"
import theme from "../one-dark-pro.desktop.json"

export default Plugin.define({
  setup(ctx) {
    ctx.add(Theme, theme)
  },
})
