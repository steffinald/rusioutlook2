package rusioutlook;

import com.backblaze.b2.client.*;
import com.backblaze.b2.client.exceptions.B2Exception;

public class B2ClientUtil {
    private static final String APP_KEY_ID = "b1ba8d088820";
    private static final String APP_KEY = "005bc94b1fe6a59579fba12ce956c5b88030ffc82d";

    private static B2StorageClient client;

    public static B2StorageClient getClient() throws B2Exception {
        if (client == null) {
        	String keyId = System.getenv("B2_APPLICATION_KEY_ID");
            String appKey = System.getenv("B2_APPLICATION_KEY");
            String bucketName = System.getenv("B2_BUCKET_NAME");
            
            client = B2StorageClientFactory
                      .createDefaultFactory()
                      .create(APP_KEY_ID, APP_KEY, "myApp");
            
            System.out.println("ENV ID: " + System.getenv("B2_APPLICATION_KEY_ID"));
            System.out.println("ENV Bucket: " + System.getenv("B2_BUCKET_NAME"));
        }
        return client;
    }
}
