import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import Battery from "gi://AstalBattery"
import Module from "./components/Module.tsx"

const bat = Battery.get_default()
const batteryPercentage = bind(bat, "percentage").as((p) => p * 100 + "%")
const charging = bind(bat, "charging")
let batteryIcon;

if (charging) {
    batteryIcon = "battery-charging"
}

export default function BatteryModule() {
    return <Module
        className="battery"
        icon="󰁿"
        label={batteryPercentage}
        onClicked={() => {console.log(charging)}}/>
}
