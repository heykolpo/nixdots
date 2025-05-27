import { App } from "astal/gtk3"
import style from "./style.scss"
import Bar from "./widget/bar/Bar.tsx"
import MprisPlayers from "./widget/media-player"
import Applauncher from "./widget/Applauncher"

App.start({
   icons: `./icons`,
   css: style,
   instanceName: "panel",
   main: () => {
       App.get_monitors().map(Bar);
   }
})
