package com.example.miguel.androidmaterial;

import android.os.Bundle;
import android.os.Handler;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.app.ActionBarActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;


public class MainActivity extends ActionBarActivity {

	ListView mListView;
	SwipeRefreshLayout mSwipeRefreshLayout;
	String[] mCatNames;
	ListAdapter mAdapter;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		mSwipeRefreshLayout = (SwipeRefreshLayout) findViewById(R.id.activity_main_swipe_refresh_layout);
		mSwipeRefreshLayout.setColorSchemeColors(R.color.orange, R.color.green, R.color.blue);
		mListView = (ListView) findViewById(R.id.activity_main_listview);
		mCatNames = getResources().getStringArray(R.array.cat_names);
		mAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, mCatNames);
		mListView.setAdapter(mAdapter);
		mSwipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
			@Override
			public void onRefresh() {
				refreshContent();
			}
		});
	}

	private void refreshContent() {
		new Handler().postDelayed(new Runnable() {
			@Override
			public void run() {
				mAdapter = new ArrayAdapter<String>(MainActivity.this, android.R.layout.simple_list_item_1, getNewCatNames());
				mListView.setAdapter(mAdapter);
				mSwipeRefreshLayout.setRefreshing(false);
			}
		}, 2500);
	}

	private List<String> getNewCatNames() {
		List<String> newCatNames = new ArrayList<String>();
		int length = mCatNames.length;
		for (int i = 0; i < length; i++) {
			int randomCatNameIndex = new Random().nextInt(length - 1);
			newCatNames.add(mCatNames[randomCatNameIndex]);
		}
		return newCatNames;
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.menu_main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();

		//noinspection SimplifiableIfStatement
		if (id == R.id.action_settings) {
			return true;
		}

		return super.onOptionsItemSelected(item);
	}
}
