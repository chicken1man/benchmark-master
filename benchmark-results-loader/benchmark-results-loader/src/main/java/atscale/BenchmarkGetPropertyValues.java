package atscale;

import java.io.File;
import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;

public class BenchmarkGetPropertyValues {

    private static BenchmarkPropertyBean properties= new BenchmarkPropertyBean();
    private static BenchmarkPropertyBean propertiesCustom = new BenchmarkPropertyBean();

    public BenchmarkPropertyBean getProperties() {
        return properties;
    }

    public static void loadPropValues() throws IOException {
 
        ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
        
        try {
            File configDefault = new File(new File("").getAbsoluteFile()+ "/config_default.yml");
            File configCustom = new File(new File("").getAbsoluteFile()+ "/config_custom.yml");

            properties = mapper.readValue(configDefault, BenchmarkPropertyBean.class);

            if (configCustom.exists()) {
                propertiesCustom = mapper.readValue(configCustom, BenchmarkPropertyBean.class);
                if (propertiesCustom != null)
                    properties.overwrite(propertiesCustom);
            }
    
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Default Config YAML does not exist or cannot be read!");
        }
	}
}
