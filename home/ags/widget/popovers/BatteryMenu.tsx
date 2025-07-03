import { Astal } from "astal/gtk3"
import { App, Astal, Gtk, Gdk } from "astal/gtk3"
//import { Gdk } from "astal/Gdk"
import { Variable, GLib, bind } from "astal"
import Hyprland from "gi://AstalHyprland"
import { batteryMenuOpen } from "./Bar.tsx"
import "../../style.scss"
import Popover from "./components/Popover.tsx"
import Tile from "./components/Tile.tsx"
import Battery from "gi://AstalBattery"

export const bat = Battery.get_default()
export const batteryPercentage = bind(bat, "percentage").as((p) => p * 100 + "%")
export const charging = bind(bat, "charging")
export let batteryIcon;

if (charging) {
    batteryIcon = "battery-charging"
}

export default function BatteryMenu() {

    console.log("hey"); 
    
    return <Popover
        halign={Gtk.Align.END}
        valign={Gtk.Align.START}
        marginTop={40}
        marginRight={12}>
        
        <Tile /> 
        <Tile /> 
    </Popover>
}

    

