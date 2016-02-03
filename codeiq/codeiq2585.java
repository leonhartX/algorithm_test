import java.io.*;
import java.util.HashMap;
import java.util.Map;
class CodeIQ
{
    public static void main (String[] args) throws java.lang.Exception
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        Map<String, String> map = new HashMap<>();
        try {
            while (true) {
                String line = br.readLine();
                if (line == null || line.length() == 0) {
                    break;
                }
                String[] keyValues = line.split(",");
                map.put(keyValues[0], keyValues[1]);
            }
        } finally {
            br.close();
        }
        System.out.println(map.get("java") != null ? map.get("java").toUpperCase() : "");
        System.out.println(map.get("ruby") != null ? map.get("ruby").toUpperCase() : "");
        System.out.println(map.get("go") != null ? map.get("go").toUpperCase() : "");
    }
}