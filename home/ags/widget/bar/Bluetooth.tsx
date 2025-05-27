import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import Module from "./components/Module.tsx"

export default function BluetoothModule() {

    return <Module
        className="bluetooth"
        icon="󰂯"
        onClicked={() => 
            exec("bluetoothctl connect AC:12:2F:FD:53:5D")
        }/>
}
