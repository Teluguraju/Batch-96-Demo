public class RedMarker extends Marker {
    public override void write() {
        System.debug('Writing some text in red.');
    } 

    // Method only in this class
    public Double computePrice() {
        return 1.5;
    }
}