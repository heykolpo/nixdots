import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import Module from "./components/Module.tsx"
import Hyprland from "gi://AstalHyprland"

export default function WindowModule() {
    const hypr = Hyprland.get_default();

    return <Module
        className="window"
        label={
            bind(hypr, "focused_client")!.as((client) => {
                if (client) {
                    return client.title
                } else {
                    return ""
                }
            })
        }
    />
}
