import { Astal, Gdk, Gtk, Widget } from "astal/gtk3"

type TileProps = 
    Pick<Widget.ButtonProps, "onClicked">


export default function Tile() {
    return <box
        className="percentage widget 2-2"
        orientation={1}
        spacing={2}>
            <label
                className="title"
                halign={Gtk.Align.START}
                valign={Gtk.Align.START} 
                wrap={true}
                xalign={0}
                label="25%"/>
            <label
                className="subtitle"
                halign={Gtk.Align.START}
                valign={Gtk.Align.START}
                wrap={true}
                xalign={0}
                label="2h 50m"/>
            <button 
                label="close"
                onClicked={() => {
                    batteryMenuOpen.set(false);
                    console.log(batteryMenuOpen.get());
                }}/>
    </box>

}
