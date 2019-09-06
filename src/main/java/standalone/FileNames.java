package standalone;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class FileNames {

	private List<String> getResourceFiles(String path) throws IOException {
	    List<String> filenames = new ArrayList<>();

	    try (
	            InputStream in = getResourceAsStream(path);
	            BufferedReader br = new BufferedReader(new InputStreamReader(in))) {
	        String resource;

	        while ((resource = br.readLine()) != null) {
	            filenames.add(resource);
	        }
	    }

	    return filenames;
	}

	private InputStream getResourceAsStream(String resource) {
	    final InputStream in
	            = getContextClassLoader().getResourceAsStream(resource);

	    return in == null ? getClass().getResourceAsStream(resource) : in;
	}

	private ClassLoader getContextClassLoader() {
	    return Thread.currentThread().getContextClassLoader();
	}
	public static void main(String[] args) {
		File file = new File("E://SpringWs//WAAProject//HumanR//src//main//webapp//resources//videos//AfcVideos");
		File[] files = file.listFiles();
		for(File f: files){
			System.out.println(f.getName());
		}
		/*try {
			filenames = flObj.getResourceFiles("E://SpringWs//WAAProject//HumanR//src//main//webapp//resources//videos//AfcVideos");
			 for(String f: filenames){
		            System.out.println(f);
		        }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		// TODO Auto-generated method stub
		
       //
	}

}
