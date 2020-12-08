package com.hoanglong2112.history_quizz

import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.Signature
import android.os.Build
import android.util.Base64
import androidx.annotation.RequiresApi
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException


class MainActivity : FlutterActivity() {
//    @RequiresApi(Build.VERSION_CODES.P)
//    override fun onCreate(savedInstanceState: android.os.Bundle?) {
//        super.onCreate(savedInstanceState)
//
//        try {
//            val info: PackageInfo = getPackageManager().getPackageInfo(
//                    "com.hoanglong2112.history_quizz",  //Insert your own package name.
//                    PackageManager.GET_SIGNING_CERTIFICATES)
//            for ( signature in info.signatures) {
//                val md: MessageDigest = MessageDigest.getInstance("SHA")
//                md.update(signature.toByteArray())
//                Log.d("KeyHash:", Base64.encodeToString(md.digest(), Base64.DEFAULT))
//            }
//        } catch (e: PackageManager.NameNotFoundException) {
//        } catch (e: NoSuchAlgorithmException) {
//        }
//    }
}
