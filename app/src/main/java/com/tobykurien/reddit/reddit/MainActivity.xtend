package com.tobykurien.reddit.reddit

import android.support.v7.app.AppCompatActivity
import org.xtendroid.app.AndroidActivity
import org.xtendroid.app.OnCreate

import static extension org.xtendroid.utils.AlertUtils.*

@AndroidActivity(R.layout.activity_main) class MainActivity extends AppCompatActivity {
    @OnCreate
    def init() {
        textView1.text = "Hello, Xtendroid!"
        btnHello.onClickListener = [
            toast("Hello to you too!")
        ]
    }
}
