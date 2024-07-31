package cash.nuofang.cash

import android.content.Intent
import android.net.VpnService
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.getDartExecutor().getBinaryMessenger(),
            CHANNEL
        ).setMethodCallHandler { call, result ->
                if (call.method.equals("startVpnService")) {
                    // 请求VPN授权
                    val intent: Intent = VpnService.prepare(this)
                    if (intent != null) {
                        startActivityForResult(intent, 0)
                    } else {
                        startVpnService()
                    }
                    result.success(null)
                } else {
                    result.notImplemented()
                }
            }
    }

    private fun startVpnService() {
        val intent: Intent = Intent(this, ClashMetaVpnService::class.java)
        startService(intent)
    }

    companion object {
        private const val CHANNEL = "vpn_service"
    }
}
