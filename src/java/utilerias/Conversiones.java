
package utilerias;

import java.text.SimpleDateFormat;
import java.util.Date;
public class Conversiones {
    public static final String FORMATO_FECHA ="dd-mm-yy";
    
    public static String formatearFecha(Date fecha){
        
        SimpleDateFormat formateador =new SimpleDateFormat (FORMATO_FECHA);
        return formateador.format(fecha);
    }
    
}
