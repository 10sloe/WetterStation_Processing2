import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

/*
*  Verbindung zu OpenSenseMap.org
*  Die Box steht in Pasing
*  Der Sensor misst die Temperatur in °C
*/
class Netzwerk
{
  private String API_URL = "https://api.opensensemap.org/boxes/5cae0ffec9e9ab001af27595/data/5cae0ffec9e9ab001af27597";
  private ArrayList<Float> messungen;

  Netzwerk()
  {
    messungen = new ArrayList<Float>();
    messwerteHolen();
  }

  public float getTemp(int i)
  {
    float f = messungen.get(i);
    return f;
  }

  public float getAktTemp()
  {    
    float f = messungen.get(0);
    return f;
  }

  public void messwerteHolen()
  {
    messungen.clear();
    String response = get(API_URL);

    try {
      JSONArray array = parseJSONArray(response);
      //System.out.println("Anzahl der Messwerte: " + array.size() );
      for (int i = 0; i < array.size(); i++) {
        JSONObject row = array.getJSONObject(i);
        String wert = row.getString("value");
        messungen.add(float(wert));
      }
    }
    catch(Exception ex)
    {
    }
  }

  public String get(String adresse) {  
    String erg = "";
    try {
      URL url = new URL(adresse);                      

      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      String readStream = readStream(con.getInputStream());
      // Give output for the command line
      //System.out.println(readStream);
      erg = readStream;
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
    return erg;
  }

  private String readStream(InputStream in) {
    StringBuilder sb = new StringBuilder();
    try {
      BufferedReader reader = new BufferedReader(new InputStreamReader(in));
      String nextLine = "";
      while ((nextLine = reader.readLine()) != null) {
        sb.append(nextLine);
      }
      reader.close();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
    return sb.toString();
  }
}
