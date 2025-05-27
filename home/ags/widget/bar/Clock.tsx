import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import Module from "./components/Module.tsx"

export default function ClockModule() {
    const time = Variable<string>("").poll(1000, () =>
        GLib.DateTime.new_now_local().format("%I:%M %p  %e/%m")!)

    return <Module
        className="clock"
        icon="󰅐"
        label={time()}/>
}
