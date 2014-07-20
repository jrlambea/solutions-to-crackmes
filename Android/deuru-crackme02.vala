/*
'
' Solución escrita en vala para el crackme02 de deuru.
' http://crackmes.de/users/deurus/android_crackme02/
'
' 2014/07/20
' spageek.net
'
*/

using Gtk;

public class keygen : Window {

		private Entry name;
    	private Entry serial;
    	private Label lbl_name;
		private Label lbl_serial;
		private Button btn_button;
		
    public keygen () {
        this.title = "Deuru's #2 KeygenMe";
        this.window_position = WindowPosition.CENTER;
        this.destroy.connect (Gtk.main_quit);
        this.set_resizable (false);
        this.set_default_size (300, 20);

        lbl_name = new Label ("Username:");
        lbl_name.set_alignment (0, 30);
        name = new Entry ();
        lbl_serial = new Label ("Serial Number:");
        lbl_serial.set_alignment (0, 30);
        serial = new Entry ();
        btn_button = new Button.with_label ("Generate");

        DateTime now = new DateTime.now_local();


        btn_button.clicked.connect (() => {
        	string text1 = name.get_text();
        	int year = now.get_year();
        	int int_name = 1;
        	int temp = 0;

        	while (int_name <= text1.length )
        	{
        		temp += year * text1.length;
        		temp += temp % 1638;
        		int_name++;
        	}
        	serial.set_text (temp.to_string());
        	stdout.printf ("%d\n", temp);
    	});

        var hbox = new Box (Orientation.VERTICAL, 5);
        hbox.homogeneous = true;
        hbox.add (lbl_name);
        hbox.add (name);
        hbox.add (lbl_serial);
        hbox.add (serial);
        hbox.add (btn_button);

        add (hbox);
    }

    public static int main (string[] args) {
        Gtk.init (ref args);

        var window = new keygen ();
        window.show_all ();

        Gtk.main ();
        return 0;
    }
}
