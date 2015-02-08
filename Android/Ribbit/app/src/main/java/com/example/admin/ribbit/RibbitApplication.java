package com.example.admin.ribbit;

import android.app.Application;

import com.parse.Parse;
import com.parse.ParseObject;

public class RibbitApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        // Enable Local Datastore.
        Parse.enableLocalDatastore(this);
        Parse.initialize(this, "Gk9fr75jlwoTN8tqg2cM1gCR5rbv1bXWtp12bQ1W", "l9fKCFDvWAdGEZMMINcg9YYqRhS0Y4qEWF9KxVX1");

    }
}
