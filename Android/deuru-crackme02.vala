/*
'
' Solución escrita en vala para el crackme02 de deuru.
' http://crackmes.de/users/deurus/android_crackme02/
'
' 2014/07/20
' spageek.net
'
*/

// Importa la librería Gtk
using Gtk;

/* Se crea una clase pública llamada keygen la cual será la que se va a
   ejecutar. Los dos puntos indican que keygen hereda la clase de Window, es
   decir: keygen hereda todos los datos y comportamiento de Gtk.Window. */
public class keygen : Window {

    /* Se establece el alcance de las diferentes variables, al estar
       dentro de la clase y fuera de las funciones, estarán disponibles
       en cada una de las rutinas, funciones y subclases.               */
	private Entry txt_name;
   	private Entry txt_serial;
   	private Label lbl_name;
	private Label lbl_serial;
	private Button btn_button;
	
    // Función pública keygen.
    public keygen () {

        /* Al haber definido anteriormente keygen con herencia de Window,
           se pueden inicializar parámetros de este objeto. Se refiere a él
           mismo como "this"                                                */
        this.title = "Deuru's #2 KeygenMe";
        this.window_position = WindowPosition.CENTER;
        this.destroy.connect (Gtk.main_quit);
        this.set_resizable (false);
        this.set_default_size (300, 20);

        // Creamos los objetos según el tipo que queramos que sean
        lbl_name = new Label ("Username:");
        lbl_serial = new Label ("Serial Number:");
        txt_name = new Entry ();
        txt_serial = new Entry ();
        btn_button = new Button.with_label ("Generate");
        DateTime now = new DateTime.now_local();

        // Cambiamos la alineación de los Labels a la izquierda
        lbl_name.set_alignment (0, 30);
        lbl_serial.set_alignment (0, 30);

        // Conectamos una función, o porción de código a un evento de un objeto
        btn_button.clicked.connect (() => {

        	string text1 = txt_name.get_text();
        	int year = now.get_year();
        	int int_name = 1;
        	int temp = 0;

        	while (int_name <= text1.length)
        	{
        		temp += year * text1.length;
        		temp += temp % 1638;
        		int_name++;
        	}

        	txt_serial.set_text (temp.to_string());
        	stdout.printf ("%d\n", temp);
    	
        });

        // Creamos un contenedor y añadimos todos los objetos anteriores
        var hbox = new Box (Orientation.VERTICAL, 5);
        hbox.homogeneous = true;
        hbox.add (lbl_name);
        hbox.add (txt_name);
        hbox.add (lbl_serial);
        hbox.add (txt_serial);
        hbox.add (btn_button);

        // Añadimos el contenedor al "Window"
        add (hbox);

    }

    // Función principal (main) de la aplicación
    public static int main (string[] args) {
        
        // Inicializa el entorno Gtk.
        Gtk.init (ref args);

        // Creamos un nuevo objeto llamado window (!= Window) tipo keygen
        var window = new keygen ();

        // Llamamos a la función show_all que hace que muestre la ventana
        window.show_all ();

        // Gtk queda a la espera de la siguiente acción por parte del usuario
        Gtk.main ();

        // Retorna 0
        return 0;

    }
    
}
