import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import Battery from "gi://AstalBattery"
import Module from "./components/Module.tsx"
import BatteryModule from "./Battery.tsx"
import WorkspacesModule from "./Workspaces.tsx"
import WindowModule from "./Window.tsx"
import ClockModule from "./Clock.tsx"
import VolumeModule from "./Volume.tsx"
import BluetoothModule from "./Bluetooth.tsx"
export default function Bar(monitor: Gdk.Monitor) {
    return <window
        className="Bar"
        name="bar"
        namespace="bar"
        anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        keymode={Astal.Keymode.ON_DEMAND}>

        <centerbox orientation={0}>
            <box>
                <WorkspacesModule/> 
            </box>

            <box>
                <WindowModule/>
            </box>
            
            <box halign={Gtk.Align.END}>
                <BluetoothModule/>
                <VolumeModule/>
                <BatteryModule/>
                <ClockModule/>
            </box>
        </centerbox>

    </window>
}
