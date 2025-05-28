import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import { exec } from "astal/process";
import Module from "./components/Module.tsx"
import Wp from "gi://AstalWp"


export default function VolumeModule() {

    const speaker = Wp.get_default()?.audio.defaultSpeaker

    return <Module
        className="volume"
        icon="󰕾"
        label={
            bind(speaker, "volume").as((v) => {
                return `${Math.round(v * 100).toString()}%`
            })
        }
        // onClicked={() => 
        //     exec("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+")
        // }
        onScroll={
           (_, { delta_y }) => {
           //if (event.delta_y < 0) exec("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+");
           if (event.delta_y > 0) exec("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-");
        }}
        />
}
