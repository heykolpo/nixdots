import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"

type moduleProps = Widget.ButtonProps & {
    icon?: string;
    label?: string;
    className?: string;
};

export default function Module({
    className = "",
    icon =  "",
    label = "",
    onClicked,
    onScroll,
    ...props
}: moduleProps) {

    return <button
        className={`module ${className}`}
        onClicked={onClicked}>
        <box spacing={icon ? 8 : 0}>
            {icon && <box className="icon-container">
                <label hexpand expand xalign={Gtk.Label.CENTER} className="icon" label={icon}/>
            </box>}
            {label && <box className="label-container">
                <label hexpand expand xalign={Gtk.Label.CENTER} className="label" label={label}/>
            </box>}
        </box>
    </button>
}

