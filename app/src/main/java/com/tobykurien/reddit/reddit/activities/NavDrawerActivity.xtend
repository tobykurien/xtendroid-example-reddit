package com.tobykurien.reddit.reddit.activities

import android.os.Bundle
import android.support.design.widget.FloatingActionButton
import android.support.design.widget.Snackbar
import android.view.View
import android.support.design.widget.NavigationView
import android.support.v4.view.GravityCompat
import android.support.v4.widget.DrawerLayout
import android.support.v7.app.ActionBarDrawerToggle
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.Toolbar
import android.view.Menu
import android.view.MenuItem
import com.tobykurien.reddit.reddit.R
import org.xtendroid.app.AndroidActivity
import org.xtendroid.app.OnCreate
import com.tobykurien.reddit.reddit.fragments.GenericFragment
import android.support.v4.app.Fragment

@AndroidActivity(R.layout.activity_nav_drawer) class NavDrawerActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener {
    @OnCreate
    def void init(Bundle savedInstanceState) {
        setSupportActionBar(toolbar)
        fab.setOnClickListener([View view|
            Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG).setAction("Action", null).show()
        ])
        var ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(this, drawerLayout, toolbar,
        R.string.navigation_drawer_open, R.string.navigation_drawer_close)
        drawerLayout.setDrawerListener(toggle)
        toggle.syncState()
        navView.setNavigationItemSelectedListener(this)
    }

    override void onBackPressed() {
        var DrawerLayout drawer = (findViewById(R.id.drawer_layout) as DrawerLayout)
        if(drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START)
        } else {
            super.onBackPressed()
        }
    }

    override boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.nav_drawer, menu)
        return true
    }

    override boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        var int id = item.getItemId()
        // noinspection SimplifiableIfStatement
        if(id === R.id.action_settings) {
            return true
        }
        return super.onOptionsItemSelected(item)
    }

    @SuppressWarnings("StatementWithEmptyBody") override boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        var int id = item.getItemId()

        var Fragment fragment = new GenericFragment()

        if(id === R.id.nav_camera) { // Handle the camera action
        } else if(id === R.id.nav_gallery) {
        } else if(id === R.id.nav_slideshow) {
        } else if(id === R.id.nav_manage) {
        } else if(id === R.id.nav_share) {
        } else if(id === R.id.nav_send) {
        }

        drawerLayout.closeDrawer(GravityCompat.START)

        // clear any existing backstack
        while (supportFragmentManager.backStackEntryCount > 0) {
            supportFragmentManager.popBackStackImmediate
        }

        supportFragmentManager.beginTransaction
            .setCustomAnimations(R.anim.slide_in_right, R.anim.slide_out_left,
                R.anim.slide_in_left, R.anim.slide_out_right)
            .replace(R.id.contentContainer, fragment)
            .commit()

        return true
    }
}
