package atscale;

// requires knowledge of keys beforehand
// getters and setters that work with TelemetryGetPropopertyValues.java

public class BenchmarkPropertyBean {

    private String google_credentials_path;
    private String google_datawarehousename;
    private String google_datasetname;
    private String google_location; 

    // add any new keys in this EXACT format
    // it's bad style but it has to be this way unfortunately

    public void overwrite(BenchmarkPropertyBean bean) {
        if (bean.google_credentials_path != null) {
            google_credentials_path = bean.getgoogle_credentials_path();
        }
        if (bean.google_datawarehousename != null) {
            google_datawarehousename = bean.getgoogle_datawarehousename();
        }
        if (bean.google_datasetname != null) {
            google_datasetname = bean.getgoogle_datasetname();
        }
        if (bean.google_location != null) {
            google_location = bean.getgoogle_location();
        }
    }
  
    //getters

    public String getgoogle_credentials_path() {
        return google_credentials_path;
    }

    public String getgoogle_datawarehousename() {
        return google_datawarehousename;
    }
    
    public String getgoogle_datasetname() {
        return google_datasetname;
    }

    public String getgoogle_location() {
        return google_location;
    }
    
    // setters 

    public void setgoogle_credentials_path(String google_credentials_path) {
        this.google_credentials_path = google_credentials_path;
    }

    public void setgoogle_datawarehousename(String google_datawarehousename) {
        this.google_datawarehousename = google_datawarehousename;
    }

    public void setgoogle_datasetname(String google_datasetname) {
        this.google_datasetname = google_datasetname;
    }

    public void setgoogle_location(String google_location) {
        this.google_location = google_location;
    }    
}
